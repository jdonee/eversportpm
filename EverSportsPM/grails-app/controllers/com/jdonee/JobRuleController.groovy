package com.jdonee

class JobRuleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [jobRuleInstanceList: JobRule.list(params), jobRuleInstanceTotal: JobRule.count()]
    }

    def create = {
        def jobRuleInstance = new JobRule()
        jobRuleInstance.properties = params
        return [jobRuleInstance: jobRuleInstance]
    }

    def save = {
        def jobRuleInstance = new JobRule(params)
        if (jobRuleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'jobRule.label', default: 'JobRule'), jobRuleInstance.id])}"
            redirect(action: "show", id: jobRuleInstance.id)
        }
        else {
            render(view: "create", model: [jobRuleInstance: jobRuleInstance])
        }
    }

    def show = {
        def jobRuleInstance = JobRule.get(params.id)
        if (!jobRuleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobRule.label', default: 'JobRule'), params.id])}"
            redirect(action: "list")
        }
        else {
            [jobRuleInstance: jobRuleInstance]
        }
    }

    def edit = {
        def jobRuleInstance = JobRule.get(params.id)
        if (!jobRuleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobRule.label', default: 'JobRule'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [jobRuleInstance: jobRuleInstance]
        }
    }

    def update = {
        def jobRuleInstance = JobRule.get(params.id)
        if (jobRuleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (jobRuleInstance.version > version) {
                    
                    jobRuleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'jobRule.label', default: 'JobRule')] as Object[], "Another user has updated this JobRule while you were editing")
                    render(view: "edit", model: [jobRuleInstance: jobRuleInstance])
                    return
                }
            }
            jobRuleInstance.properties = params
            if (!jobRuleInstance.hasErrors() && jobRuleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'jobRule.label', default: 'JobRule'), jobRuleInstance.id])}"
                redirect(action: "show", id: jobRuleInstance.id)
            }
            else {
                render(view: "edit", model: [jobRuleInstance: jobRuleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobRule.label', default: 'JobRule'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def jobRuleInstance = JobRule.get(params.id)
        if (jobRuleInstance) {
            try {
                jobRuleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'jobRule.label', default: 'JobRule'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'jobRule.label', default: 'JobRule'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobRule.label', default: 'JobRule'), params.id])}"
            redirect(action: "list")
        }
    }
}
