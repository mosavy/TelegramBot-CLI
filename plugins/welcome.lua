local function pre_process(msg)
	local chat = msg.chat_id_
	local user = msg.sender_user_id_
	local group = load_data('bot/group.json')
	local function welcome_cb(arg, data)
	    --local wel = wel:gsub("{name1}", check_markdown(data.first_name_))
		if group[arg.chat_id]['setwelcome'] then
			welcome = group[arg.chat_id]['setwelcome']
		else
			welcome = "*Welcome* :D"
		end
		if data.username_ then
			user_name = "@"..check_markdown(data.username_)
		else
			user_name = ""
		end
		local welcome = welcome:gsub("{name}", check_markdown(data.first_name_))
		local welcome = welcome:gsub("{username}", user_name)
		tg.sendMessage(arg.chat_id, arg.msg_id, 0, welcome, 0, "md")
	end
	if group[tostring(chat)] and group[tostring(chat)]['settings'] then
	    local adduser = msg.text:match("!!!tgservice:adduser")
		if adduser then
			welcome = group[tostring(msg.chat_id_)]['settings']['welcome']
			if welcome == 'yes' then
				tdcli_function ({
				ID = "GetUser",
				user_id_ = adduser
				}, welcome_cb, {chat_id=chat,msg_id=msg.id_})
			else
				return false
			end
		end
		local joinuser = msg.text:match("!!!tgservice:joinuser")
		if joinuser then
			welcome = group[tostring(msg.chat_id_)]['settings']['welcome']
			if welcome == 'yes' then
				tdcli_function ({
				ID = "GetUser",
				user_id_ = joinuser
				}, welcome_cb, {chat_id=chat,msg_id=msg.id_})
			else
				return false
			end
		end
	end
end

local function run(msg, matches)
    local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	local chat = msg.chat_id_
	local user = msg.sender_user_id_
	if addgroup and is_owner(msg) or is_momod(msg) then
		if matches[1] == 'welcome' then
			if matches[2] == 'on' then
				welcome = group[tostring(chat)]['settings']['welcome']
				if welcome == 'yes' then
					tg.sendMessage(msg.chat_id_, msg.id_, 1, '*SuperGroup welcome is already enabled*', 1, 'md')
				else	
					group[tostring(chat)]['settings']['welcome'] = 'yes'
					save_data(_config.group.data, group)
					tg.sendMessage(msg.chat_id_, msg.id_, 1, '*SuperGroup welcome has been enabled*', 1, 'md')
				end
			end
			if matches[2] == 'off' then
				welcome = group[tostring(chat)]['settings']['welcome']
				if welcome == 'no' then
					tg.sendMessage(msg.chat_id_, msg.id_, 1, 'SuperGroup Welcome is already disabled', 1, 'md')
				else
					group[tostring(chat)]['settings']['welcome'] = 'no'
					save_data(_config.group.data, group)
					tg.sendMessage(msg.chat_id_, msg.id_, 1, 'SuperGroup welcome has been disabled', 1, 'md')
				end
			end
		end
		if matches[1] == 'setwelcome' and matches[2] then
			group[tostring(chat)]['setwelcome'] = matches[2]
			save_data(_config.group.data, group)
			tg.sendMessage(msg.chat_id_, msg.id_, 1, '*Welcome message has been set to:*\n'..matches[2]..'\n--------------------------------------\n*You can use:*\n`{name}` ➣ New Member First Name\n`{username}` ➣ New Member Username', 1, 'md')
		end
	end	
end
return {
	patterns ={
		"^[/#!]([Ss]etwelcome) (.*)",
		"^[/#!]([Ww]elcome) (.*)$"
	},
	run=run,
	pre_process = pre_process
}

--bot.lua
    elseif msg.content_.ID == "MessageChatAddMembers" then
        msg.text = "!!!tgservice:adduser"
	elseif msg.content_.ID == "MessageChatJoinByLink" then
        msg.text = "!!!tgservice:joinuser"	
--bot.lua


--lock-lua
pm = pm..'\n23- <code>Welcome</code> : '..group[tostring(target)]['settings']['welcome']..''
--lock.lua 