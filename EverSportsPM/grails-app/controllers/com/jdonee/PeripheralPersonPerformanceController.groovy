package com.jdonee

import grails.converters.JSON
import com.jdonee.utils.PerformanceStatus
import com.jdonee.utils.Constants
class PeripheralPersonPerformanceController {

	def springSecurityService
	def personalPerformanceService
	def jobService
	def index = {
		redirect(action: "list", params: params)
	}

	def list = {
		params.max = Math.min(params.max ? params.int('max') : 10, 100)
		[personalPerformanceInstanceList: personalPerformanceService.findAllPeripheralPersonalPerformanceByUser(currentUser,params), personalPerformanceInstanceTotal: PersonalPerformance.count()]
	}

	def show = {
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		def currectJob=new Job()
		if (!personalPerformanceInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
			redirect(action: "list")
		}else {
			def peripheralPeople=personalPerformanceInstance.peripheralPeople
			if(peripheralPeople!=null&&peripheralPeople.length()>0){
				def codes=peripheralPeople.tokenize(Constants.COMMA_SEPARATOR)
				personalPerformanceService.getCodesByUser(currentUser).each { jobCode->
					if(jobCode in codes){
						currectJob=jobService.findCurrectJobByCode(jobCode)
						return
					}
				}
			}
			[personalPerformanceInstance: personalPerformanceInstance,currectJob:currectJob]
		}
	}

	private getCurrentUser() {
		return User.get(springSecurityService.principal.id)
	}
}
