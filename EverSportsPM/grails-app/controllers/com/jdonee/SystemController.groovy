package com.jdonee

class SystemController {
	
	static allowedMethods =[GET:"show", PUT:"update", DELETE:"delete", POST:"save"]

	def springSecurityService
	def jobService
    def index = { 
		def currentUserInstance = null
		if (springSecurityService.isLoggedIn()) {
			currentUserInstance = currentUser
			def checkMenuPermission = session["checkMenuPermission"]
			session["checkMenuPermission"] = jobService.checkPermissionByUser(currentUser)
			//println session["checkMenuPermission"]
		}
		[user:currentUserInstance]
	}
	
	private getCurrentUser() {
		return User.get(springSecurityService.principal.id)
	}
}
