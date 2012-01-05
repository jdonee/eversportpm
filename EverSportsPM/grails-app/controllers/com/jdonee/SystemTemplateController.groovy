package com.jdonee

class SystemTemplateController {

    static allowedMethods =[GET:"show", PUT:"update", DELETE:"delete", POST:"save"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [systemTemplateInstanceList: SystemTemplate.list(params), systemTemplateInstanceTotal: SystemTemplate.count()]
    }

    def create = {
        def systemTemplateInstance = new SystemTemplate()
        systemTemplateInstance.properties = params
        return [systemTemplateInstance: systemTemplateInstance]
    }

    def save = {
        def systemTemplateInstance = new SystemTemplate(params)
		if(checkUnique(params)!=null){
			flash.message = "${message(code: 'systemTemplate.unique.failure', default:'This type can only exist in one of the available record.')}"
			render(view: "create", model: [systemTemplateInstance: systemTemplateInstance])
			return
		}
        if (systemTemplateInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'systemTemplate.label', default: 'SystemTemplate'), systemTemplateInstance.id])}"
            redirect(action: "show", id: systemTemplateInstance.id)
        }
        else {
            render(view: "create", model: [systemTemplateInstance: systemTemplateInstance])
        }
    }

    def show = {
        def systemTemplateInstance = SystemTemplate.get(params.id)
        if (!systemTemplateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'systemTemplate.label', default: 'SystemTemplate'), params.id])}"
            redirect(action: "list")
        }
        else {
            [systemTemplateInstance: systemTemplateInstance]
        }
    }

    def edit = {
        def systemTemplateInstance = SystemTemplate.get(params.id)
        if (!systemTemplateInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'systemTemplate.label', default: 'SystemTemplate'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [systemTemplateInstance: systemTemplateInstance]
        }
    }

    def update = {
        def systemTemplateInstance = SystemTemplate.get(params.id)
        if (systemTemplateInstance) {
			if(checkUnique(params)!=null){
				flash.message = "${message(code: 'systemTemplate.unique.failure', default:'This type can only exist in one of the available record.')}"
				render(view: "edit", model: [systemTemplateInstance: systemTemplateInstance])
				return
			}
            if (params.version) {
                def version = params.version.toLong()
                if (systemTemplateInstance.version > version) {
                    
                    systemTemplateInstance.errors.rejectValue("templateType", "default.optimistic.locking.failure", [message(code: 'systemTemplate.label', default: 'SystemTemplate')] as Object[], "Another user has updated this SystemTemplate while you were editing")
                    render(view: "edit", model: [systemTemplateInstance: systemTemplateInstance])
                    return
                }
            }
            systemTemplateInstance.properties = params
            if (!systemTemplateInstance.hasErrors() && systemTemplateInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'systemTemplate.label', default: 'SystemTemplate'), systemTemplateInstance.id])}"
                redirect(action: "show", id: systemTemplateInstance.id)
            }
            else {
                render(view: "edit", model: [systemTemplateInstance: systemTemplateInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'systemTemplate.label', default: 'SystemTemplate'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def systemTemplateInstance = SystemTemplate.get(params.id)
        if (systemTemplateInstance) {
            try {
                systemTemplateInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'systemTemplate.label', default: 'SystemTemplate'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'systemTemplate.label', default: 'SystemTemplate'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'systemTemplate.label', default: 'SystemTemplate'), params.id])}"
            redirect(action: "list")
        }
    }
	
	def checkUnique(def params){
		return SystemTemplate.findByTemplateTypeAndEnabled(params.templateType,params.enabled)
	}
}
