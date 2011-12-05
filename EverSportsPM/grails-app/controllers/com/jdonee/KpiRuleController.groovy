package com.jdonee

import grails.converters.JSON
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

	def updateKpiRule = {
		def kpiRuleInstance = KpiRule.get(params.kpiRuleId)
		def objectMap=[:]
		if (kpiRuleInstance) {
			kpiRuleInstance.properties = params
			if (kpiRuleInstance.save(flush: true)) {
				objectMap.put("id",kpiRuleInstance.id)
				objectMap.put("desiredItem",kpiRuleInstance.desiredItem)
				objectMap.put("targetValue",kpiRuleInstance.targetValue)
				objectMap.put("description",kpiRuleInstance.description)
				objectMap.put("actualValue",kpiRuleInstance.actualValue)
				objectMap.put("score",kpiRuleInstance.score)
				objectMap.put("weight",kpiRuleInstance.weight)
			}
		}
		render objectMap as JSON
	}

	def getKpiRuleById={
		def kpiRuleInstance = KpiRule.get(params.id)
		def objectMap=[:]
		if (kpiRuleInstance) {
			objectMap.put("id",kpiRuleInstance.id)
			objectMap.put("desiredItem",kpiRuleInstance.desiredItem)
			objectMap.put("targetValue",kpiRuleInstance.targetValue)
			objectMap.put("description",kpiRuleInstance.description)
			objectMap.put("weight",kpiRuleInstance.weight)
		}
		render objectMap as JSON
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
}
