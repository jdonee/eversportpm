package com.jdonee

class SystemController {

	def springSecurityService
    def index = { 
		def currentUserInstance = null
		if (springSecurityService.isLoggedIn()) {
			currentUserInstance = User.get(springSecurityService.principal.id)
		}
		[user:currentUserInstance]
	}
}
