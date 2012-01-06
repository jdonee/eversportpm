package com.jdonee

class UserController {

    static allowedMethods =[GET:"show", PUT:"update", DELETE:"delete", POST:"save"]
	def springSecurityService
	def filterPaneService
    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userInstanceList: User.list(params), userInstanceTotal: User.count()]
    }
	
	def filter = {
		if(!params.max) params.max = Math.min(params.max ? params.int('max') : 10, 100)
		render( view:"list",
			model:[ userInstanceList: filterPaneService.filter( params, User ),
			userCount: filterPaneService.count( params, User ),
			filterParams: org.grails.plugin.filterpane.FilterPaneUtils.extractFilterParams(params), params:params ]
		)
	}

    def create = {
        def userInstance = new User()
		def roleInstanceList = Role.getAll()
        userInstance.properties = params
        return [userInstance: userInstance,roleInstanceList:roleInstanceList]
    }

    def save = {
        def userInstance = new User(params)
		if(params.password){
			userInstance.password = springSecurityService.encodePassword(params.password)
		}
        if (userInstance.save(flush: true)) {
			for (roleId in params.list('roles')) {
				def roleInstance=Role.get(roleId.toLong())
				UserRole.create(userInstance,roleInstance, true)
			}
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
            redirect(action: "show", id: userInstance.id)
        }
        else {
            render(view: "create", model: [userInstance: userInstance])
        }
    }

    def show = {
        def userInstance = User.get(params.id)
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userInstance: userInstance]
        }
    }

    def edit = {
        def userInstance = User.get(params.id)
		def roleInstanceList = Role.getAll()
        if (!userInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userInstance: userInstance,roleInstanceList:roleInstanceList]
        }
    }

    def update = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userInstance.version > version) {
                    userInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'user.label', default: 'User')] as Object[], "Another user has updated this User while you were editing")
                    render(view: "edit", model: [userInstance: userInstance])
                    return
                }
            }
			if(params.password&&params.password!=userInstance.password){
				params.password = springSecurityService.encodePassword(params.password)
			}
			userInstance.properties = params
            if (!userInstance.hasErrors() && userInstance.save(flush: true)) {
				UserRole.removeAll(userInstance)//同步删除中间表数据
				for (roleId in params.list('roles')) {
					def roleInstance=Role.get(roleId.toLong())
					UserRole.create(userInstance,roleInstance , true)
				}
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'user.label', default: 'User'), userInstance.id])}"
                redirect(action: "show", id: userInstance.id)
            }
            else {
                render(view: "edit", model: [userInstance: userInstance])
            }
        }else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def userInstance = User.get(params.id)
        if (userInstance) {
            try {
				UserRole.removeAll(userInstance)//同步删除中间表数据
                userInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'user.label', default: 'User'), params.id])}"
            redirect(action: "list")
        }
    }
}
