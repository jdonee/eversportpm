package com.jdonee

class UserFilters {

	def springSecurityService
    def filters = {
		all(uri: '/**') {
			after = { model ->
				if (model && springSecurityService.isLoggedIn()) {
					model['user'] = User.get(springSecurityService.principal.id)
				}
			}
		}
//        all(controller:'*', action:'*') {
//            before = {
//                
//            }
//            after = {
//                
//            }
//            afterView = {
//                
//            }
//        }
    }
    
}
