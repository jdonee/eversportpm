package com.jdonee

import grails.converters.JSON
class PersonInfoController {

	def springSecurityService
	
	def index = {
			def userInstance = User.get(currentUser.id)
	        if (!userInstance) {
	            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
	            redirect(controller: 'system', action:'index')
	        }
	        else {
	            [userInstance: userInstance]
	        }
		}
	
	def changePwd = {
		def userInstance = User.get(currentUser.id)
		def messageMap=[:]
		if (userInstance) {
			if(params.password.length()>0){
				userInstance.password = springSecurityService.encodePassword(params.password)
			}
			if(userInstance.save(flush: true)){
				messageMap.put("message", "${message(code: 'personInfo.changePwd.message', default: 'Change Success')}")
			}
		}else {
				messageMap.put("message", "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), currentUser.id])}")
		}
		render messageMap as JSON
	}
	
	private getCurrentUser() {
		return User.get(springSecurityService.principal.id)
	}
}
