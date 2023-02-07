/proc/webhook_send_roundstatus(status, extraData)
	var/list/query = list("status" = status)

	if(extraData)
		query.Add(extraData)

	webhook_send("roundstatus", query)

/proc/webhook_send_asay(ckey, message)
	var/list/query = list("ckey" = ckey, "message" = message)
	webhook_send("asaymessage", query)

/proc/webhook_send_ooc(ckey, message)
	var/list/query = list("ckey" = ckey, "message" = message)
	webhook_send("oocmessage", query)

/proc/webhook_send_me(ckey, message)
	var/list/query = list("ckey" = ckey, "message" = message)
	webhook_send("memessage", query)

/proc/webhook_send_status_update(event, data)
	var/list/query = list("event" = event, "data" = data)
	webhook_send("status_update", query)

/*
/proc/webhook_send_ahelp(ckey, message)
	var/list/query = list("ckey" = ckey, "message" = message)
	webhook_send("ahelpmessage", query)

/proc/webhook_send_runtime(message) //when server logging gets fucked up, discord bot saves the day
	var/list/query = list("message" = message)
	webhook_send("runtimemessage", query)

/proc/webhook_send_garbage(ckey, message)
	var/list/query = list("ckey" = ckey, "message" = message)
	webhook_send("garbage", query)

*/

/proc/webhook_send(method, data)
	if (!config.webhook_address_invst || !config.comms_key)
		return

	var/query = "[config.webhook_address_invst]?key=[config.comms_key]&method=[method]&data=[url_encode(json_encode(data))]"
	spawn(-1)
		world.Export(query)

