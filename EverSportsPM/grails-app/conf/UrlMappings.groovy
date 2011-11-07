class UrlMappings {
	
	static excludes = ["/images/**", "/css/**","/js/**"] //排除

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
		
		"/login/$action?"(controller: "login")
		"/logout"(controller: "logout")
		"/"(controller:"system",action:"index")
		"403"(controller: "errors", action: "error403")
		"400"(controller: "errors", action: "fakeError")
		"302"(controller: "errors", action: "fakeError")
		"500"(controller: "errors", action: "error403", exception: AccessDeniedException)
		"500"(controller: "errors", action: "error400", exception: NotFoundException)
		"500"(controller: "errors", action: "handleMemory", exception: OutOfMemoryError)
		"500"(controller: "errors", action: "handleDatabase", exception: CannotCreateTransactionException)
		"500"(controller: "errors", action: "handleDatabase", exception: CommunicationsException)
		//"/"(view:"/index")
		//"500"(view:'/error')
		//"500"(controller: "error", action: "serverError")
		//"404"(controller: "error", action: "notFound")
		//"403"(controller: "error", action: "forbidden")
	}
}
