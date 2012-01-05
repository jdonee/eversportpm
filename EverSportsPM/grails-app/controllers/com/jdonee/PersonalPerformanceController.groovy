package com.jdonee

import grails.converters.JSON
import com.jdonee.utils.PerformanceStatus
import com.jdonee.utils.Constants
class PersonalPerformanceController {

	static allowedMethods =[GET:"show", PUT:"update", DELETE:"delete", POST:"save"]

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
	
	def getPersonalPerformances ={
		assert null != params.jobId
		assert null != params.performanceId
		render personalPerformanceService.findAllPersonalPerformancesByPerformanceAndJob(params.performanceId,params.jobId) as JSON
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[personalPerformanceInstanceList: personalPerformanceService.findAllPersonalPerformanceByUser(currentUser,jobService.getCodesByUser(currentUser),params), personalPerformanceInstanceTotal: PersonalPerformance.count()]
	}

	def create = {
		def personalPerformanceInstance = new PersonalPerformance()
		personalPerformanceInstance.properties = params
		return [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)]
	}

	def save = {
		def personalPerformanceInstance = new PersonalPerformance(params)
		if(checkUnique(params)){
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
	
	
	def copy = {
		def personalPerformanceInstance = new PersonalPerformance()
		personalPerformanceInstance.properties = params
		return [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)]
	}
	
	def copyAndSave={
		def personalPerformanceInstance = new PersonalPerformance(params)
		def personalPerformanceId=params.long('personalPerformanceId')
		if(!personalPerformanceId){
			flash.message = "${message(code: 'personalPerformance.not.select.message', default:'Please select a valid Personal Performance.')}"
			render(view: "copy", model: [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)])
			return
		}
		if(checkUnique(params)){
			flash.message = "${message(code: 'personalPerformance.unique.failure', default:'This performance can only exist in one of the available record.')}"
			render(view: "copy", model: [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)])
			return
		}
		if (personalPerformanceInstance.save(flush: true)) {
			personalPerformanceService.initPersonalPerformance(personalPerformanceInstance)
			if(personalPerformanceId){
				def sourcePersonalPerformanceInstance=PersonalPerformance.get(personalPerformanceId)
				if(sourcePersonalPerformanceInstance){
					personalPerformanceService.copyPersonalPerformance(sourcePersonalPerformanceInstance,personalPerformanceInstance)
				}
			}
			flash.message = "${message(code: 'default.created.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
			redirect(action: "show", id: personalPerformanceInstance.id)
		}
		else {
			render(view: "copy", model: [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)])
		}
	}

	def show = {
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		def jobInstanceList=[]
		if (!personalPerformanceInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
			redirect(action: "list")
		}
		else {
			def peripheralPeople=personalPerformanceInstance.peripheralPeople
			if(peripheralPeople!=null&&peripheralPeople.length()>0){
				jobInstanceList=jobService.findAllPeripheralPeopleByCodes(peripheralPeople.tokenize(Constants.COMMA_SEPARATOR))
			}
			[personalPerformanceInstance: personalPerformanceInstance,checkPermission:jobService.checkPermissionByUserAndJobCode(currentUser,personalPerformanceInstance.job.code),jobInstanceList:jobInstanceList]
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
		/*指标输入完成*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			if(!personalPerformanceService.isJusticeWeight(personalPerformanceInstance)){
				flash.message = "${message(code: 'personalPerformance.not.updated.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance')])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
				return
			}
			personalPerformanceInstance.status=PerformanceStatus.INPUT_FINISHED
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.inputFinish.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}

	def refreshInput = {
		/*重新输入*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.INIT
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.refreshInput.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}

	def audit = {
		/*审核*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			if(personalPerformanceInstance.peripheralPeople!=null&&personalPerformanceInstance.peripheralPeople.length()>0){
				def jobs=jobService.findAllPeripheralPeopleByCodes(personalPerformanceInstance.peripheralPeople.tokenize(Constants.COMMA_SEPARATOR))
				def jobRules=personalPerformanceInstance.jobRules
				if(jobRules){
					jobRules.each { value ->
						personalPerformanceService.saveJobRuleScores(value,jobs)
					}
				}	
			}
			personalPerformanceInstance.status=PerformanceStatus.SUPERIOR_AUDITING
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.audit.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def abandon = {
		/*弃审*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.jobRules.each {  JobRuleScore.removeAll(it) }
			personalPerformanceInstance.status=PerformanceStatus.INPUT_FINISHED
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.abandon.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def openAssess = {
		/*准备考核*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.OPEN_ASSESS
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.openAssess.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}

	def update = {
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			if(checkUnique(params)){
				flash.message = "${message(code: 'personalPerformance.unique.failure', default:'This performance can only exist in one of the available record.')}"
				render(view: "edit", model: [personalPerformanceInstance: personalPerformanceInstance,jobInstanceList:jobService.findAllJobByUser(currentUser)])
				return
			}
			if (params.version) {
				def version = params.version.toLong()
				if (personalPerformanceInstance.version > version) {

					personalPerformanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'personalPerformance.label', default: 'PersonalPerformance')]
					as Object[], "Another user has updated this PersonalPerformance while you were editing")
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
		def personalPerformanceCount=PersonalPerformance.findAllByPerformanceAndJob(Performance.get(params.long('performance.id')),Job.get(params.long('job.id'))).size()
		def boo=Boolean.FALSE
		if(params.id==null){
			boo=(personalPerformanceCount>0)
		}else{
			if(params.performanceId!=params.performance.id||params.jobId!=params.job.id){
				boo=(personalPerformanceCount>0)
			}else{
				boo=(personalPerformanceCount>1)
			}
		}
		return boo
	}
}
