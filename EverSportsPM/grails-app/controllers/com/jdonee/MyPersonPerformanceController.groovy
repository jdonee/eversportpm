package com.jdonee

import grails.converters.JSON
import com.jdonee.utils.PerformanceStatus
import com.jdonee.utils.Constants
class MyPersonPerformanceController {

	def springSecurityService
	def personalPerformanceService
	def jobService
    def index = {
		redirect(action: "list", params: params)
	}
	
	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[personalPerformanceInstanceList: personalPerformanceService.findAllMyPersonalPerformanceByUser(jobService.getCodesByUser(currentUser),params), personalPerformanceInstanceTotal: PersonalPerformance.count()]
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
	
	def personSummary = {
		/*完成员工自评*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.PERSON_SUMMARY
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.personSummary.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def refreshPersonSummary = {
		/*重新自评*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.OPEN_ASSESS
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.openAssess.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def personAffirm = {
		/*员工确认完成*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.PERSON_AFFIRM
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.personAffirm.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def refreshPersonAffirm = {
		/*员工重新确认*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.SUPERIOR_SUMMARY
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.superiorSummary.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	private getCurrentUser() {
		return User.get(springSecurityService.principal.id)
	}
}
