package com.jdonee

class SystemController {

	def springSecurityService
	def jobService
    def index = { 
		def currentUserInstance = null
		if (springSecurityService.isLoggedIn()) {
			currentUserInstance = currentUser
			def checkPermission = session["checkPermission"]
			session["checkPermission"] = jobService.checkPermissionByUser(currentUser)
			println session["checkPermission"]
		}
		[user:currentUserInstance]
	}
	
	private getCurrentUser() {
		return User.get(springSecurityService.principal.id)
	}
}
