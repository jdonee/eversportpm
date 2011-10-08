package com.jdonee

class CompanyRuleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [companyRuleInstanceList: CompanyRule.list(params), companyRuleInstanceTotal: CompanyRule.count()]
    }

    def create = {
        def companyRuleInstance = new CompanyRule()
        companyRuleInstance.properties = params
        return [companyRuleInstance: companyRuleInstance]
    }

    def save = {
        def companyRuleInstance = new CompanyRule(params)
        if (companyRuleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'companyRule.label', default: 'CompanyRule'), companyRuleInstance.id])}"
            redirect(action: "show", id: companyRuleInstance.id)
        }
        else {
            render(view: "create", model: [companyRuleInstance: companyRuleInstance])
        }
    }

    def show = {
        def companyRuleInstance = CompanyRule.get(params.id)
        if (!companyRuleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'companyRule.label', default: 'CompanyRule'), params.id])}"
            redirect(action: "list")
        }
        else {
            [companyRuleInstance: companyRuleInstance]
        }
    }

    def edit = {
        def companyRuleInstance = CompanyRule.get(params.id)
        if (!companyRuleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'companyRule.label', default: 'CompanyRule'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [companyRuleInstance: companyRuleInstance]
        }
    }

    def update = {
        def companyRuleInstance = CompanyRule.get(params.id)
        if (companyRuleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (companyRuleInstance.version > version) {
                    
                    companyRuleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'companyRule.label', default: 'CompanyRule')] as Object[], "Another user has updated this CompanyRule while you were editing")
                    render(view: "edit", model: [companyRuleInstance: companyRuleInstance])
                    return
                }
            }
            companyRuleInstance.properties = params
            if (!companyRuleInstance.hasErrors() && companyRuleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'companyRule.label', default: 'CompanyRule'), companyRuleInstance.id])}"
                redirect(action: "show", id: companyRuleInstance.id)
            }
            else {
                render(view: "edit", model: [companyRuleInstance: companyRuleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'companyRule.label', default: 'CompanyRule'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def companyRuleInstance = CompanyRule.get(params.id)
        if (companyRuleInstance) {
            try {
                companyRuleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'companyRule.label', default: 'CompanyRule'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'companyRule.label', default: 'CompanyRule'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'companyRule.label', default: 'CompanyRule'), params.id])}"
            redirect(action: "list")
        }
    }
}
