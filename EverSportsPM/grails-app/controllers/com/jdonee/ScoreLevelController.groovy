package com.jdonee

class ScoreLevelController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [scoreLevelInstanceList: ScoreLevel.list(params), scoreLevelInstanceTotal: ScoreLevel.count()]
    }

    def create = {
        def scoreLevelInstance = new ScoreLevel()
        scoreLevelInstance.properties = params
        return [scoreLevelInstance: scoreLevelInstance]
    }

    def save = {
        def scoreLevelInstance = new ScoreLevel(params)
        if (scoreLevelInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'scoreLevel.label', default: 'ScoreLevel'), scoreLevelInstance.id])}"
            redirect(action: "show", id: scoreLevelInstance.id)
        }
        else {
            render(view: "create", model: [scoreLevelInstance: scoreLevelInstance])
        }
    }

    def show = {
        def scoreLevelInstance = ScoreLevel.get(params.id)
        if (!scoreLevelInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'scoreLevel.label', default: 'ScoreLevel'), params.id])}"
            redirect(action: "list")
        }
        else {
            [scoreLevelInstance: scoreLevelInstance]
        }
    }

    def edit = {
        def scoreLevelInstance = ScoreLevel.get(params.id)
        if (!scoreLevelInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'scoreLevel.label', default: 'ScoreLevel'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [scoreLevelInstance: scoreLevelInstance]
        }
    }

    def update = {
        def scoreLevelInstance = ScoreLevel.get(params.id)
        if (scoreLevelInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (scoreLevelInstance.version > version) {
                    
                    scoreLevelInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'scoreLevel.label', default: 'ScoreLevel')] as Object[], "Another user has updated this ScoreLevel while you were editing")
                    render(view: "edit", model: [scoreLevelInstance: scoreLevelInstance])
                    return
                }
            }
            scoreLevelInstance.properties = params
            if (!scoreLevelInstance.hasErrors() && scoreLevelInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'scoreLevel.label', default: 'ScoreLevel'), scoreLevelInstance.id])}"
                redirect(action: "show", id: scoreLevelInstance.id)
            }
            else {
                render(view: "edit", model: [scoreLevelInstance: scoreLevelInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'scoreLevel.label', default: 'ScoreLevel'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def scoreLevelInstance = ScoreLevel.get(params.id)
        if (scoreLevelInstance) {
            try {
                scoreLevelInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'scoreLevel.label', default: 'ScoreLevel'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'scoreLevel.label', default: 'ScoreLevel'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'scoreLevel.label', default: 'ScoreLevel'), params.id])}"
            redirect(action: "list")
        }
    }
}
