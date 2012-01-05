package com.jdonee

class JobTypeController {

    static allowedMethods =[GET:"show", PUT:"update", DELETE:"delete", POST:"save"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [jobTypeInstanceList: JobType.list(params), jobTypeInstanceTotal: JobType.count()]
    }

    def create = {
        def jobTypeInstance = new JobType()
        jobTypeInstance.properties = params
        return [jobTypeInstance: jobTypeInstance]
    }

    def save = {
        def jobTypeInstance = new JobType(params)
        if (jobTypeInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'jobType.label', default: 'JobType'), jobTypeInstance.id])}"
            redirect(action: "show", id: jobTypeInstance.id)
        }
        else {
            render(view: "create", model: [jobTypeInstance: jobTypeInstance])
        }
    }

    def show = {
        def jobTypeInstance = JobType.get(params.id)
        if (!jobTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobType.label', default: 'JobType'), params.id])}"
            redirect(action: "list")
        }
        else {
            [jobTypeInstance: jobTypeInstance]
        }
    }

    def edit = {
        def jobTypeInstance = JobType.get(params.id)
        if (!jobTypeInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobType.label', default: 'JobType'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [jobTypeInstance: jobTypeInstance]
        }
    }

    def update = {
        def jobTypeInstance = JobType.get(params.id)
        if (jobTypeInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (jobTypeInstance.version > version) {
                    
                    jobTypeInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'jobType.label', default: 'JobType')] as Object[], "Another user has updated this JobType while you were editing")
                    render(view: "edit", model: [jobTypeInstance: jobTypeInstance])
                    return
                }
            }
            jobTypeInstance.properties = params
            if (!jobTypeInstance.hasErrors() && jobTypeInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'jobType.label', default: 'JobType'), jobTypeInstance.id])}"
                redirect(action: "show", id: jobTypeInstance.id)
            }
            else {
                render(view: "edit", model: [jobTypeInstance: jobTypeInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobType.label', default: 'JobType'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def jobTypeInstance = JobType.get(params.id)
        if (jobTypeInstance) {
            try {
                jobTypeInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'jobType.label', default: 'JobType'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'jobType.label', default: 'JobType'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'jobType.label', default: 'JobType'), params.id])}"
            redirect(action: "list")
        }
    }
}
