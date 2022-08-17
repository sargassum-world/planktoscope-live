# Code generated by github.com/hairyhenderson/gomplate DO NOT EDIT.

package sargassum.pslive.web.policies.instruments

import future.keywords

import data.sargassum.godest.routing

# Policy Scope

in_scope if {
	"/instruments" == input.resource.path
}

in_scope if {
	glob.match("/instruments/*", [], input.resource.path)
}

# Policy Result & Error

matching_routes contains route if {
	"GET" == input.operation.method
	["instruments"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "GET /instruments"
}

allow if {
	"GET" == input.operation.method
	["instruments"] = split(trim_prefix(input.resource.path, "/"), "/")
}

matching_routes contains route if {
	"POST" == input.operation.method
	["instruments"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "POST /instruments"
}

allow if {
	"POST" == input.operation.method
	["instruments"] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_instruments_post(input.subject)
}

matching_routes contains route if {
	"GET" == input.operation.method
	["instruments", id] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "GET /instruments/:id"
}

allow if {
	"GET" == input.operation.method
	["instruments", id] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_instrument_get(id)
}

matching_routes contains route if {
	"POST" == input.operation.method
	["instruments", id] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "POST /instruments/:id"
}

allow if {
	"POST" == input.operation.method
	["instruments", id] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_instrument_post(input.subject, id)
}

matching_routes contains route if {
	"POST" == input.operation.method
	["instruments", id, "name"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "POST /instruments/:id/name"
}

allow if {
	"POST" == input.operation.method
	["instruments", id, "name"] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_instrument_post(input.subject, id)
}

matching_routes contains route if {
	"POST" == input.operation.method
	["instruments", id, "description"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "POST /instruments/:id/description"
}

allow if {
	"POST" == input.operation.method
	["instruments", id, "description"] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_instrument_post(input.subject, id)
}

matching_routes contains route if {
	"GET" == input.operation.method
	["instruments", id, "users"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "GET /instruments/:id/users"
}

allow if {
	"GET" == input.operation.method
	["instruments", id, "users"] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_instrument_get(id)
}

matching_routes contains route if {
	"SUB" == input.operation.method
	["instruments", id, "users"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "SUB /instruments/:id/users"
}

allow if {
	"SUB" == input.operation.method
	["instruments", id, "users"] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_instrument_get(id)
}

matching_routes contains route if {
	"UNSUB" == input.operation.method
	["instruments", id, "users"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "UNSUB /instruments/:id/users"
}

allow if {
	"UNSUB" == input.operation.method
	["instruments", id, "users"] = split(trim_prefix(input.resource.path, "/"), "/")
}

matching_routes contains route if {
	"MSG" == input.operation.method
	["instruments", id, "users"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "MSG /instruments/:id/users"
}

allow if {
	"MSG" == input.operation.method
	["instruments", id, "users"] = split(trim_prefix(input.resource.path, "/"), "/")
}

matching_routes contains route if {
	"POST" == input.operation.method
	["instruments", id, "cameras"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "POST /instruments/:id/cameras"
}

allow if {
	"POST" == input.operation.method
	["instruments", id, "cameras"] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_instrument_post(input.subject, id)
}

matching_routes contains route if {
	"POST" == input.operation.method
	["instruments", id, "cameras", camera_id] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "POST /instruments/:id/cameras/:camera_id"
}

allow if {
	"POST" == input.operation.method
	["instruments", id, "cameras", camera_id] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_camera_post(input.subject, id, camera_id)
}

matching_routes contains route if {
	"POST" == input.operation.method
	["instruments", id, "controllers"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "POST /instruments/:id/controllers"
}

allow if {
	"POST" == input.operation.method
	["instruments", id, "controllers"] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_instrument_post(input.subject, id)
}

matching_routes contains route if {
	"POST" == input.operation.method
	["instruments", id, "controllers", controller_id] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "POST /instruments/:id/controllers/:controller_id"
}

allow if {
	"POST" == input.operation.method
	["instruments", id, "controllers", controller_id] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_controller_post(input.subject, id, controller_id)
}

matching_routes contains route if {
	"SUB" == input.operation.method
	["instruments", id, "controllers", controller_id, "pump"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "SUB /instruments/:id/controllers/:controller_id/pump"
}

allow if {
	"SUB" == input.operation.method
	["instruments", id, "controllers", controller_id, "pump"] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_controller_get(id, id, controller_id)
}

matching_routes contains route if {
	"PUB" == input.operation.method
	["instruments", id, "controllers", controller_id, "pump"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "PUB /instruments/:id/controllers/:controller_id/pump"
}

allow if {
	"PUB" == input.operation.method
	["instruments", id, "controllers", controller_id, "pump"] = split(trim_prefix(input.resource.path, "/"), "/")
}

matching_routes contains route if {
	"MSG" == input.operation.method
	["instruments", id, "controllers", controller_id, "pump"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "MSG /instruments/:id/controllers/:controller_id/pump"
}

allow if {
	"MSG" == input.operation.method
	["instruments", id, "controllers", controller_id, "pump"] = split(trim_prefix(input.resource.path, "/"), "/")
}

matching_routes contains route if {
	"POST" == input.operation.method
	["instruments", id, "controllers", controller_id, "pump"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "POST /instruments/:id/controllers/:controller_id/pump"
}

allow if {
	"POST" == input.operation.method
	["instruments", id, "controllers", controller_id, "pump"] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_controller_pump_post(input.subject, id, controller_id)
}

matching_routes contains route if {
	"GET" == input.operation.method
	["instruments", id, "chat", "messages"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "GET /instruments/:id/chat/messages"
}

allow if {
	"GET" == input.operation.method
	["instruments", id, "chat", "messages"] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_instrument_get(id)
}

matching_routes contains route if {
	"SUB" == input.operation.method
	["instruments", id, "chat", "messages"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "SUB /instruments/:id/chat/messages"
}

allow if {
	"SUB" == input.operation.method
	["instruments", id, "chat", "messages"] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_instrument_get(id)
}

matching_routes contains route if {
	"MSG" == input.operation.method
	["instruments", id, "chat", "messages"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "MSG /instruments/:id/chat/messages"
}

allow if {
	"MSG" == input.operation.method
	["instruments", id, "chat", "messages"] = split(trim_prefix(input.resource.path, "/"), "/")
}

matching_routes contains route if {
	"POST" == input.operation.method
	["instruments", id, "chat", "messages"] = split(trim_prefix(input.resource.path, "/"), "/")
	route := "POST /instruments/:id/chat/messages"
}

allow if {
	"POST" == input.operation.method
	["instruments", id, "chat", "messages"] = split(trim_prefix(input.resource.path, "/"), "/")
	allow_instrument_chat_post(input.subject, id)
}

errors contains error_matching if {
	in_scope
	error_matching := routing.error_matching_routes(matching_routes)
}