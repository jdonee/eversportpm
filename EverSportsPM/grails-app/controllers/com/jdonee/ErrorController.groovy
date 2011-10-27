package com.jdonee

import grails.converters.JSON

class ErrorController {
	
	def springSecurityService
	
	 def error403 = {
		if(!springSecurityService.isLoggedIn())
		  redirect(action:'error401')
		else if (springSecurityService.isAjax(request))
		  render(status: 403, text: [error: message(code: 'is.error.denied')])
		else
		  redirect(controller: 'login', action:'index')
	  }
	 
	  def error401 = {
		if (springSecurityService.isAjax(request))
		  render(status: 401, text:'')
		else{
		  render(template:'error401', status: 401, model:[ref:params.ref])
		}
	  }
	  
	  def fakeError = {
	  
	 }
	
	  def handleDatabase = {
			render(status:500, contentType:'application/json', text:[error:message(code: 'is.error.database')] as JSON)
	  }
	
	  def handleMemory = {
			render(status:500, contentType:'application/json', text:[error:message(code: 'is.error.permgen')] as JSON)
	  }
}
