package com.jdonee

import grails.converters.JSON
class JobRuleScoreController {
	def personalPerformanceService

    static allowedMethods =[GET:"show", PUT:"update", DELETE:"delete", POST:"save"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [jobRuleScoreInstanceList: JobRuleScore.list(params), jobRuleScoreInstanceTotal: JobRuleScore.count()]
    }

    def create = {
        def jobRuleScoreInstance = new JobRuleScore()
        jobRuleScoreInstance.properties = params
        return [jobRuleScoreInstance: jobRuleScoreInstance]
    }

    def save = {
        def jobRuleScoreInstance = new JobRuleScore(params)
        if (jobRuleScoreInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'jobRuleScore.label', default: 'JobRuleScore'), jobRuleScoreInstance.id])}"
            redirect(action: "show", id: jobRuleScoreInstance.id)
        }
        else {
            render(view: "create", model: [jobRuleScoreInstance: jobRuleScoreInstance])
        }
    }

    def show = {
        def jobRuleScoreInstance = JobRuleScore.get(params.id)
        if (!jobRuleScoreInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobRuleScore.label', default: 'JobRuleScore'), params.id])}"
            redirect(action: "list")
        }
        else {
            [jobRuleScoreInstance: jobRuleScoreInstance]
        }
    }

    def edit = {
        def jobRuleScoreInstance = JobRuleScore.get(params.id)
        if (!jobRuleScoreInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobRuleScore.label', default: 'JobRuleScore'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [jobRuleScoreInstance: jobRuleScoreInstance]
        }
    }

    def update = {
        def jobRuleScoreInstance = JobRuleScore.get(params.id)
        if (jobRuleScoreInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (jobRuleScoreInstance.version > version) {
                    
                    jobRuleScoreInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'jobRuleScore.label', default: 'JobRuleScore')] as Object[], "Another user has updated this JobRuleScore while you were editing")
                    render(view: "edit", model: [jobRuleScoreInstance: jobRuleScoreInstance])
                    return
                }
            }
            jobRuleScoreInstance.properties = params
            if (!jobRuleScoreInstance.hasErrors() && jobRuleScoreInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'jobRuleScore.label', default: 'JobRuleScore'), jobRuleScoreInstance.id])}"
                redirect(action: "show", id: jobRuleScoreInstance.id)
            }
            else {
                render(view: "edit", model: [jobRuleScoreInstance: jobRuleScoreInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobRuleScore.label', default: 'JobRuleScore'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def jobRuleScoreInstance = JobRuleScore.get(params.id)
        if (jobRuleScoreInstance) {
            try {
                jobRuleScoreInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'jobRuleScore.label', default: 'JobRuleScore'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'jobRuleScore.label', default: 'JobRuleScore'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobRuleScore.label', default: 'JobRuleScore'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def updateJobRuleScore = {
		def jobRuleScoreInstance = JobRuleScore.get(params.jobRuleScoreId)
		def objectMap=[:]
		if (jobRuleScoreInstance) {
			jobRuleScoreInstance.properties = params
			jobRuleScoreInstance.used=Boolean.TRUE
			if (jobRuleScoreInstance.save(flush: true)) {
				personalPerformanceService.changeJobRuleScore(jobRuleScoreInstance.jobRule)
				objectMap.put("id",jobRuleScoreInstance.id)
				objectMap.put("jobItem",jobRuleScoreInstance.jobRule.jobItem)
				objectMap.put("personSummary",jobRuleScoreInstance.jobRule.personSummary)
				objectMap.put("peripheralScore",jobRuleScoreInstance.jobRule.peripheralScore)
				objectMap.put("score",jobRuleScoreInstance.score)
				if(jobRuleScoreInstance.used==Boolean.TRUE){
					objectMap.put("used", "${message(code: 'default.boolean.true')}")
				}else{
					objectMap.put("used", "${message(code: 'default.boolean.false')}")
				}
				if(jobRuleScoreInstance.jobRule.customed==Boolean.TRUE){
					objectMap.put("customed", "${message(code: 'default.boolean.true')}")
				}else{
					objectMap.put("customed", "${message(code: 'default.boolean.false')}")
				}
			}
		}
		render objectMap as JSON
	}

	def getJobRuleScoreById={
		def jobRuleScoreInstance = JobRuleScore.get(params.id)
		def objectMap=[:]
		if (jobRuleScoreInstance) {
			objectMap.put("id",jobRuleScoreInstance.id)
			objectMap.put("jobItem",jobRuleScoreInstance.jobRule.jobItem)
			objectMap.put("personSummary",jobRuleScoreInstance.jobRule.personSummary)
			objectMap.put("score",jobRuleScoreInstance.score)
			objectMap.put("customed",jobRuleScoreInstance.jobRule.customed)
			objectMap.put("used",jobRuleScoreInstance.used)
		}
		render objectMap as JSON
	}
}
