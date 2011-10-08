package com.jdonee

class UserRoleController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [userRoleInstanceList: UserRole.list(params), userRoleInstanceTotal: UserRole.count()]
    }

    def create = {
        def userRoleInstance = new UserRole()
        userRoleInstance.properties = params
        return [userRoleInstance: userRoleInstance]
    }

    def save = {
		for(userId in params.list('user.id')) {
			def userRoleInstance = UserRole.create(User.get(userId.toLong()), Role.get(params.long('role.id')), true)
	        if (!userRoleInstance) {
	            render(view: "create", model: [userRoleInstance: userRoleInstance])
	        }		
		}
		flash.message = "${message(code: 'default.created.message', args: ['the userRoles was created'])}"
		redirect(action: "list")
    }

    def show = {
        def userRoleInstance = UserRole.get(params.id)
        if (!userRoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
            redirect(action: "list")
        }
        else {
            [userRoleInstance: userRoleInstance]
        }
    }

    def edit = {
        def userRoleInstance = UserRole.get(params.id)
        if (!userRoleInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [userRoleInstance: userRoleInstance]
        }
    }

    def update = {
        def userRoleInstance = UserRole.get(params.id)
        if (userRoleInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (userRoleInstance.version > version) {
                    
                    userRoleInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'userRole.label', default: 'UserRole')] as Object[], "Another user has updated this UserRole while you were editing")
                    render(view: "edit", model: [userRoleInstance: userRoleInstance])
                    return
                }
            }
            userRoleInstance.properties = params
            if (!userRoleInstance.hasErrors() && userRoleInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'userRole.label', default: 'UserRole'), userRoleInstance.id])}"
                redirect(action: "show", id: userRoleInstance.id)
            }
            else {
                render(view: "edit", model: [userRoleInstance: userRoleInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		def userId=params.long('user.id')
		def roleId=params.long('role.id')
        def userRoleInstance = UserRole.get(userId,roleId)
        if (userRoleInstance) {
            try {
                userRoleInstance.remove(User.get(userId),Role.get(roleId), true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'userRole.label', default: 'UserRole'), params.id])}"
            redirect(action: "list")
        }
    }
}
