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
		"/"(view:"/index")
		"500"(view:'/error')
		//"500"(controller: "error", action: "serverError")
		"404"(controller: "error", action: "notFound")
		"403"(controller: "error", action: "forbidden")
	}
}
