package com.jdonee

import grails.converters.JSON
import com.jdonee.utils.PerformanceStatus
class PersonalPerformanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService
	def personalPerformanceService
	def jobService

    def index = {
        redirect(action: "list", params: params)
    }
	
	def searchJobByCodeJSON = {
		String code = params.remove('term');
		List jobs = jobService.searchJobByCode(code)
		render jobs as JSON
	}

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [personalPerformanceInstanceList: personalPerformanceService.findAllPersonalPerformanceByUser(currentUser,params), personalPerformanceInstanceTotal: PersonalPerformance.count()]
    }

    def create = {
        def personalPerformanceInstance = new PersonalPerformance()
        personalPerformanceInstance.properties = params
        return [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)]
    }

    def save = {
        def personalPerformanceInstance = new PersonalPerformance(params)
		if(checkUnique(params)!=null){
			flash.message = "${message(code: 'personalPerformance.unique.failure', default:'This performance can only exist in one of the available record.')}"
			render(view: "create", model: [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)])
			return
		}
        if (personalPerformanceInstance.save(flush: true)) {
			personalPerformanceService.initPersonalPerformance(personalPerformanceInstance)
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
            redirect(action: "show", id: personalPerformanceInstance.id)
        }
        else {
            render(view: "create", model: [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)])
        }
    }
	
	def saveKpiRule = {
		def kpiRuleInstance = new KpiRule(desiredItem:params.desiredItem,targetValue:params.targetValue,description:params.description,weight:params.weight,personalPerformance:PersonalPerformance.get(params.personalPerformanceId))
		def objectMap=[:]
		if (kpiRuleInstance.save(flush: true)) {
			objectMap.put("id",kpiRuleInstance.id)
			objectMap.put("desiredItem",kpiRuleInstance.desiredItem)
			objectMap.put("targetValue",kpiRuleInstance.targetValue)
			objectMap.put("description",kpiRuleInstance.description)
			objectMap.put("weight",kpiRuleInstance.weight)
		}
		render objectMap as JSON
	}
	
	def saveJobRule = {
		def jobRuleInstance = new JobRule(jobItem:params.jobItem,personalPerformance:PersonalPerformance.get(params.personalPerformanceId))
		def objectMap=[:]
		if (jobRuleInstance.save(flush: true)) {
			objectMap.put("id",jobRuleInstance.id)
			objectMap.put("jobItem",jobRuleInstance.jobItem)
			if(jobRuleInstance.customed==Boolean.TRUE){
				objectMap.put("customed", "${message(code: 'default.boolean.true')}")
			}else{
				objectMap.put("customed", "${message(code: 'default.boolean.false')}")
			}
		}
		render objectMap as JSON
	}
	
	def saveCompanyRule = {
		def companyRuleInstance = new CompanyRule(content:params.content,personalPerformance:PersonalPerformance.get(params.personalPerformanceId))
		def objectMap=[:]
		if (companyRuleInstance.save(flush: true)) {
			objectMap.put("id",companyRuleInstance.id)
			objectMap.put("content",companyRuleInstance.content)
			if(companyRuleInstance.customed==Boolean.TRUE){
				objectMap.put("customed", "${message(code: 'default.boolean.true')}")
			}else{
				objectMap.put("customed", "${message(code: 'default.boolean.false')}")
			}
		}
		render objectMap as JSON
	}

    def show = {
        def personalPerformanceInstance = PersonalPerformance.get(params.id)
        if (!personalPerformanceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
            redirect(action: "list")
        }
        else {
            [personalPerformanceInstance: personalPerformanceInstance]
        }
    }

    def edit = {
        def personalPerformanceInstance = PersonalPerformance.get(params.id)
        if (!personalPerformanceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)]
        }
    }
	
	def inputFinish = {
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			  if(!personalPerformanceService.isJusticeWeight(personalPerformanceInstance)){
					flash.message = "${message(code: 'personalPerformance.not.updated.message', args: [message(code: 'performance.label', default: 'Performance')])}"
					render(view: "show", model: [personalPerformanceInstance: personalPerformanceInstance])
					return
			   }
			   personalPerformanceInstance.status=PerformanceStatus.INPUT_FINISHED
               if( personalPerformanceInstance.save(flush: true)){
                 flash.message = "${message(code: 'default.updated.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
                 redirect(action: "show", id: personalPerformanceInstance.id)
				}
		}
    }

    def update = {
        def personalPerformanceInstance = PersonalPerformance.get(params.id)
        if (personalPerformanceInstance) {
			if(checkUnique(params)!=null){
				flash.message = "${message(code: 'personalPerformance.unique.failure', default:'This performance can only exist in one of the available record.')}"
				render(view: "edit", model: [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)])
				return
			}
            if (params.version) {
                def version = params.version.toLong()
                if (personalPerformanceInstance.version > version) {
                    
                    personalPerformanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'personalPerformance.label', default: 'PersonalPerformance')] as Object[], "Another user has updated this PersonalPerformance while you were editing")
                    render(view: "edit", model: [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)])
                    return
                }
            }
            personalPerformanceInstance.properties = params
            if (!personalPerformanceInstance.hasErrors() && personalPerformanceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
                redirect(action: "show", id: personalPerformanceInstance.id)
            }
            else {
                render(view: "edit", model: [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def deleteJobRuleById={
		def jobRuleInstance = JobRule.get(params.id)
		def messageMap=[:]
		if (jobRuleInstance) {
			try {
				jobRuleInstance.delete(flush: true)
				messageMap.put("message", "${message(code: 'default.deleted.message', args: [message(code: 'jobRule.label', default: 'JobRule'), params.id])}")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				messageMap.put("error", "${message(code: 'default.not.deleted.message', args: [message(code: 'jobRule.label', default: 'JobRule'), params.id])}")
			}
		}
		else {
			messageMap.put("error", "${message(code: 'default.not.found.message', args: [message(code: 'jobRule.label', default: 'JobRule'), params.id])}")
		}
		render messageMap as JSON
	}
	
	def deleteKpiRuleById={
		def kpiRuleInstance = KpiRule.get(params.id)
		def messageMap=[:]
		if (kpiRuleInstance) {
			try {
				kpiRuleInstance.delete(flush: true)
				messageMap.put("message", "${message(code: 'default.deleted.message', args: [message(code: 'kpiRule.label', default: 'KpiRule'), params.id])}")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				messageMap.put("error", "${message(code: 'default.not.deleted.message', args: [message(code: 'kpiRule.label', default: 'KpiRule'), params.id])}")
			}
		}
		else {
			messageMap.put("error", "${message(code: 'default.not.found.message', args: [message(code: 'kpiRule.label', default: 'KpiRule'), params.id])}")
		}
		render messageMap as JSON
	}
	
	def deleteCompanyRuleById={
		def companyRuleInstance = CompanyRule.get(params.id)
		def messageMap=[:]
		if (companyRuleInstance) {
			try {
				companyRuleInstance.delete(flush: true)
				messageMap.put("message", "${message(code: 'default.deleted.message', args: [message(code: 'companyRule.label', default: 'CompanyRule'), params.id])}")
			}
			catch (org.springframework.dao.DataIntegrityViolationException e) {
				messageMap.put("error", "${message(code: 'default.not.deleted.message', args: [message(code: 'companyRule.label', default: 'CompanyRule'), params.id])}")
			}
		}
		else {
			messageMap.put("error", "${message(code: 'default.not.found.message', args: [message(code: 'companyRule.label', default: 'CompanyRule'), params.id])}")
		}
		render messageMap as JSON
	}

    def delete = {
        def personalPerformanceInstance = PersonalPerformance.get(params.id)
        if (personalPerformanceInstance) {
            try {
                personalPerformanceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
            redirect(action: "list")
        }
    }
	
	private getCurrentUser() {
		return User.get(springSecurityService.principal.id)
	}
	
	def checkUnique(def params){
		return PersonalPerformance.findByPerformanceAndJob(Performance.get(params.long('performance.id')),Job.get(params.long('job.id')))
	}
}
