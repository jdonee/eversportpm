package com.jdonee

class PerformanceController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [performanceInstanceList: Performance.list(params), performanceInstanceTotal: Performance.count()]
    }

    def create = {
        def performanceInstance = new Performance()
        performanceInstance.properties = params
        return [performanceInstance: performanceInstance]
    }

    def save = {
        def performanceInstance = new Performance(params)
		if(!performanceInstance.isJusticeWeight()){
			flash.message = "${message(code: 'performance.not.updated.message', args: [message(code: 'performance.label', default: 'Performance')])}"
			render(view: "create", model: [performanceInstance: performanceInstance])
			return
		}
		if (performanceInstance.save(flush: true)) {
				flash.message = "${message(code: 'default.created.message', args: [message(code: 'performance.label', default: 'Performance'), performanceInstance.id])}"
				redirect(action: "show", id: performanceInstance.id)
		}
		else {
				render(view: "create", model: [performanceInstance: performanceInstance])
		}
    }

    def show = {
        def performanceInstance = Performance.get(params.id)
        if (!performanceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'performance.label', default: 'Performance'), params.id])}"
            redirect(action: "list")
        }
        else {
            [performanceInstance: performanceInstance]
        }
    }

    def edit = {
        def performanceInstance = Performance.get(params.id)
        if (!performanceInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'performance.label', default: 'Performance'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [performanceInstance: performanceInstance]
        }
    }

    def update = {
        def performanceInstance = Performance.get(params.id)
        if (performanceInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (performanceInstance.version > version) {
                    
                    performanceInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'performance.label', default: 'Performance')] as Object[], "Another user has updated this Performance while you were editing")
                    render(view: "edit", model: [performanceInstance: performanceInstance])
                    return
                }
            }
            performanceInstance.properties = params
			if(!performanceInstance.isJusticeWeight()){
				flash.message = "${message(code: 'performance.not.updated.message', args: [message(code: 'performance.label', default: 'Performance')])}"
				render(view: "edit", model: [performanceInstance: performanceInstance])
				return 
			}
            if (!performanceInstance.hasErrors() && performanceInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'performance.label', default: 'Performance'), performanceInstance.id])}"
                redirect(action: "show", id: performanceInstance.id)
            }
            else {
                render(view: "edit", model: [performanceInstance: performanceInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'performance.label', default: 'Performance'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def performanceInstance = Performance.get(params.id)
        if (performanceInstance) {
            try {
                performanceInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'performance.label', default: 'Performance'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'performance.label', default: 'Performance'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'performance.label', default: 'Performance'), params.id])}"
            redirect(action: "list")
        }
    }
}
