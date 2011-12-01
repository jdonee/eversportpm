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
		[personalPerformanceInstanceList: personalPerformanceService.findAllMyPersonalPerformanceByUser(currentUser,params), personalPerformanceInstanceTotal: PersonalPerformance.count()]
	}
	
	def show = {
		def personalPerformanceInstance = PersonalPerformance.get(params.id)
		def jobInstanceList=[]
		if (!personalPerformanceInstance) {
			flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
			redirect(action: "list")
		}
		else {
			def peripheralPeople=personalPerformanceInstance.peripheralPeople
			if(peripheralPeople!=null&&peripheralPeople.length()>0){
				jobInstanceList=jobService.findAllPeripheralPeopleByCodes(peripheralPeople.tokenize(Constants.COMMA_SEPARATOR))
			}
			[personalPerformanceInstance: personalPerformanceInstance,checkPermission:jobService.checkPermissionByUserAndJobCode(currentUser,personalPerformanceInstance.job.code),jobInstanceList:jobInstanceList]
		}
	}
	
	private getCurrentUser() {
		return User.get(springSecurityService.principal.id)
	}
}
