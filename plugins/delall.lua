local function action_by_reply(arg, data)
	local cmd = arg.cmd
	if not tonumber(data.sender_user_id_) then return false end
	if data.sender_user_id_ then
		if cmd == "delall" and not is_owner(msg) or not is_momod(msg) then
			tg.deleteMessagesFromUser(data.chat_id_, data.sender_user_id_, dl_cb, nil)
			tg.sendMessage(data.chat_id_, "", 0, "*All messages user [* `"..data.sender_user_id_.."` *] has been deleted*", 0, "md")
		end
	else
		tg.sendMessage(data.chat_id_, "", 0, "*User does not exist*\n\n`Channel:` @LeaderCh", 0, "md")
	end
end

local function action_by_username(arg, data)
	local cmd = arg.cmd
	if not arg.username then return false end
	if data.id_ then
		if data.type_.user_.username_ then
			user_name = '@'..check_markdown(data.type_.user_.username_)
		else
			user_name = check_markdown(data.title_)
		end
		if cmd == "delall" and not is_owner(msg) or not is_momod(msg) then
			tg.deleteMessagesFromUser(arg.chat_id, data.id_, dl_cb, nil)
			tg.sendMessage(arg.chat_id, "", 0, "*All messages user [* `"..data.id_.."` *] has been deleted*", 0, "md")
		end
	else
		tg.sendMessage(arg.chat_id, "", 0, "*User does not exist*\n\n`Channel:` @LeaderCh", 0, "md")
	end
end

local function run(msg, matches)
	local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	chat = msg.chat_id_
	user = msg.sender_user_id_
	if addgroup and is_owner(msg) or is_momod(msg) then
		if matches[1] == "delall" then
			if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
				tdcli_function ({
				ID = "GetMessage",
				chat_id_ = msg.chat_id_,
				message_id_ = msg.reply_to_message_id_
				}, action_by_reply, {chat_id=msg.chat_id_,cmd="delall"})
			end
			if matches[2] and string.match(matches[2], '^%d+$') then
				if not is_momod(msg) or not is_owner(msg) then
					tg.deleteMessagesFromUser(msg.chat_id_, matches[2], dl_cb, nil)
					tg.sendMessage(msg.chat_id_, "", 0, "*All messages user [* `"..matches[2].."` *] has been deleted*", 0, "md")
				end	
			end
			if matches[2] and not string.match(matches[2], '^%d+$') then
				tg_function ({
				ID = "SearchPublicChat",
				username_ = matches[2]
				}, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="delall"})
			end
		end
	end	
end
return {
	patterns = {
		"^[!/#]([Dd]elall)$",
		"^[!/#]([Dd]elall) (.*)$",
	},
	run = run,
pre_process = pre_process
}
