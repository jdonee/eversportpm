package com.jdonee

class PersonInfoController {

	def springSecurityService
	
	def index = {
		def user = currentUser
		render("You are now following ${user.username}")
		}
	
	private getCurrentUser() {
		return User.get(springSecurityService.principal.id)
	}
}
