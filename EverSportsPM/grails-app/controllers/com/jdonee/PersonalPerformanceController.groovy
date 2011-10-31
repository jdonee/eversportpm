package com.jdonee

class PersonalPerformanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
	
	def springSecurityService
	def personalPerformanceService

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
		def user = currentUser
        [personalPerformanceInstanceList: personalPerformanceService.findAllPersonalPerformanceByUser(user,params), personalPerformanceInstanceTotal: PersonalPerformance.count()]
    }

    def create = {
        def personalPerformanceInstance = new PersonalPerformance()
        personalPerformanceInstance.properties = params
        return [personalPerformanceInstance: personalPerformanceInstance]
    }

    def save = {
        def personalPerformanceInstance = new PersonalPerformance(params)
        if (personalPerformanceInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
            redirect(action: "show", id: personalPerformanceInstance.id)
        }
        else {
            render(view: "create", model: [personalPerformanceInstance: personalPerformanceInstance])
        }
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

    def edit = {
        def personalPerformanceInstance = PersonalPerformance.get(params.id)
        if (!personalPerformanceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [personalPerformanceInstance: personalPerformanceInstance]
        }
    }

    def update = {
        def personalPerformanceInstance = PersonalPerformance.get(params.id)
        if (personalPerformanceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (personalPerformanceInstance.version > version) {
                    
                    personalPerformanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'personalPerformance.label', default: 'PersonalPerformance')] as Object[], "Another user has updated this PersonalPerformance while you were editing")
                    render(view: "edit", model: [personalPerformanceInstance: personalPerformanceInstance])
                    return
                }
            }
            personalPerformanceInstance.properties = params
            if (!personalPerformanceInstance.hasErrors() && personalPerformanceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), personalPerformanceInstance.id])}"
                redirect(action: "show", id: personalPerformanceInstance.id)
            }
            else {
                render(view: "edit", model: [personalPerformanceInstance: personalPerformanceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def personalPerformanceInstance = PersonalPerformance.get(params.id)
        if (personalPerformanceInstance) {
            try {
                personalPerformanceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'personalPerformance.label', default: 'PersonalPerformance'), params.id])}"
            redirect(action: "list")
        }
    }
	
	private getCurrentUser() {
		return User.get(springSecurityService.principal.id)
	}
}
