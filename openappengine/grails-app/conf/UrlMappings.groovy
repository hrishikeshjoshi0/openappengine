class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}

		"/"(view:"/index")
		"/grid"(view:"/grid")
		"500"(view:'/error')
		"/login/$action?"(controller: "login")
		"/logout/$action?"(controller: "logout")
	}
}
