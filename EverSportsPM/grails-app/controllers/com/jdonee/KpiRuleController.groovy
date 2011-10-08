package com.jdonee

class KpiRuleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [kpiRuleInstanceList: KpiRule.list(params), kpiRuleInstanceTotal: KpiRule.count()]
    }

    def create = {
        def kpiRuleInstance = new KpiRule()
        kpiRuleInstance.properties = params
        return [kpiRuleInstance: kpiRuleInstance]
    }

    def save = {
        def kpiRuleInstance = new KpiRule(params)
        if (kpiRuleInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'kpiRule.label', default: 'KpiRule'), kpiRuleInstance.id])}"
            redirect(action: "show", id: kpiRuleInstance.id)
        }
        else {
            render(view: "create", model: [kpiRuleInstance: kpiRuleInstance])
        }
    }

    def show = {
        def kpiRuleInstance = KpiRule.get(params.id)
        if (!kpiRuleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'kpiRule.label', default: 'KpiRule'), params.id])}"
            redirect(action: "list")
        }
        else {
            [kpiRuleInstance: kpiRuleInstance]
        }
    }

    def edit = {
        def kpiRuleInstance = KpiRule.get(params.id)
        if (!kpiRuleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'kpiRule.label', default: 'KpiRule'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [kpiRuleInstance: kpiRuleInstance]
        }
    }

    def update = {
        def kpiRuleInstance = KpiRule.get(params.id)
        if (kpiRuleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (kpiRuleInstance.version > version) {
                    
                    kpiRuleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'kpiRule.label', default: 'KpiRule')] as Object[], "Another user has updated this KpiRule while you were editing")
                    render(view: "edit", model: [kpiRuleInstance: kpiRuleInstance])
                    return
                }
            }
            kpiRuleInstance.properties = params
            if (!kpiRuleInstance.hasErrors() && kpiRuleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'kpiRule.label', default: 'KpiRule'), kpiRuleInstance.id])}"
                redirect(action: "show", id: kpiRuleInstance.id)
            }
            else {
                render(view: "edit", model: [kpiRuleInstance: kpiRuleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'kpiRule.label', default: 'KpiRule'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def kpiRuleInstance = KpiRule.get(params.id)
        if (kpiRuleInstance) {
            try {
                kpiRuleInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'kpiRule.label', default: 'KpiRule'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'kpiRule.label', default: 'KpiRule'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'kpiRule.label', default: 'KpiRule'), params.id])}"
            redirect(action: "list")
        }
    }
}
