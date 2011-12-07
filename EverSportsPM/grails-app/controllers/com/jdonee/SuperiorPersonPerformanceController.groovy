package com.jdonee

import grails.converters.JSON
import com.jdonee.utils.PerformanceStatus
import com.jdonee.utils.Constants
class SuperiorPersonPerformanceController {
	def springSecurityService
	def personalPerformanceService
	def jobService

    def index = {
		redirect(action: "list", params: params)
	}
	
	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[personalPerformanceInstanceList: personalPerformanceService.findAllSuperiorPersonalPerformanceByUser(currentUser,jobService.getCodesByUser(currentUser),params), personalPerformanceInstanceTotal: PersonalPerformance.count()]
	}
	
	def show = {
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		def jobInstanceList=[]
		if (!personalPerformanceInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
			redirect(action: "list")
		}
		else {
			[personalPerformanceInstance: personalPerformanceInstance]
		}
	}
	
	def superiorSummary = {
		/*完成上级考评*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.SUPERIOR_SUMMARY
			if( personalPerformanceInstance.save(flush: true)){
				
				flash.message = "${message(code: 'personalPerformance.superiorSummary.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def refreshSuperiorSummary = {
		/*上级重新考评*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.PERSON_SUMMARY
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.personSummary.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def superiorAffirm = {
		/*完成上级确认*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.SUPERIOR_AFFIRM
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.superiorAffirm.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def refreshSuperiorAffirm = {
		/*上级重新确认*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.PERSON_AFFIRM
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.personAffirm.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	def closeAssess = {
		/*关闭考核*/
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		if (personalPerformanceInstance) {
			personalPerformanceInstance.status=PerformanceStatus.CLOSE_ASSESS
			if( personalPerformanceInstance.save(flush: true)){
				flash.message = "${message(code: 'personalPerformance.closeAssess.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
				redirect(action: "show", id: personalPerformanceInstance.id)
			}
		}
	}
	
	private getCurrentUser() {
		return User.get(springSecurityService.principal.id)
	}
	
	def scoringPersonalPerformance(personalPerformance){
		//TODO:
		personalPerformance.jobRules
		return personalPerformance
	}
}
