package com.jdonee

import grails.converters.JSON

class CompanyRuleController {

	//static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	static allowedMethods =[GET:"show", PUT:"update", DELETE:"delete", POST:"save"]

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

					companyRuleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [
						message(code: 'companyRule.label', default: 'CompanyRule')]
					as Object[], "Another user has updated this CompanyRule while you were editing")
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

	def saveCompanyRule = {
		def companyRuleInstance = new CompanyRule(content:params.content,personalPerformance:PersonalPerformance.get(params.personalPerformanceId))
		def objectMap=[:]
		if (companyRuleInstance.save(flush: true)) {
			objectMap.put("id",companyRuleInstance.id)
			objectMap.put("content",companyRuleInstance.content==null?"":companyRuleInstance.content)
			if(companyRuleInstance.customed==Boolean.TRUE){
				objectMap.put("customed", "${message(code: 'default.boolean.true')}")
			}else{
				objectMap.put("customed", "${message(code: 'default.boolean.false')}")
			}
		}
		render objectMap as JSON
	}

	def updateCompanyRule = {
		def companyRuleInstance = CompanyRule.get(params.companyRuleId)
		def objectMap=[:]
		if (companyRuleInstance) {
			companyRuleInstance.properties = params
			if (companyRuleInstance.save(flush: true)) {
				objectMap.put("id",companyRuleInstance.id)
				objectMap.put("content",companyRuleInstance.content==null?"":companyRuleInstance.content)
				objectMap.put("personSummary",companyRuleInstance.personSummary==null?"":companyRuleInstance.personSummary)
				objectMap.put("appraise",companyRuleInstance.appraise==null?"":companyRuleInstance.appraise)
				objectMap.put("expectation",companyRuleInstance.expectation==null?"":companyRuleInstance.expectation)
				if(companyRuleInstance.customed==Boolean.TRUE){
					objectMap.put("customed", "${message(code: 'default.boolean.true')}")
				}else{
					objectMap.put("customed", "${message(code: 'default.boolean.false')}")
				}
			}
		}
		render objectMap as JSON
	}

	def getCompanyRuleById={
		def companyRuleInstance = CompanyRule.get(params.id)
		def objectMap=[:]
		if (companyRuleInstance) {
			objectMap.put("id",companyRuleInstance.id)
			objectMap.put("content",companyRuleInstance.content==null?"":companyRuleInstance.content)
			objectMap.put("personSummary",companyRuleInstance.personSummary==null?"":companyRuleInstance.personSummary)
			objectMap.put("appraise",companyRuleInstance.appraise==null?"":companyRuleInstance.appraise)
			objectMap.put("expectation",companyRuleInstance.expectation==null?"":companyRuleInstance.expectation)
			objectMap.put("customed",companyRuleInstance.customed)
		}
		render objectMap as JSON
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
}
