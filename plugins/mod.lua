--[[local function modlist(msg)
    local group = load_data('bot/group.json')
    local i = 1
	if next(group[tostring(msg.chat_id_)]['moderators']) == 0 then 
		text1 = '*No moderator in this group*'
		tg.sendMessage(msg.chat_id_, 0, 1, text1, 1, 'md')
	end
	local message = '*List of moderators :* \n'
	for k,v in pairs(group[tostring(msg.chat_id_)]['moderators']) do
		message = message.. '*' ..i.. '-* ' ..v.. ' [' ..k.. '] \n'
		i = i + 1
	end
	tg.sendMessage(msg.chat_id_, 0, 1, message, 1, 'md')
end]]

--[[local function ownerlist(msg)
    local group = load_data('bot/group.json')
	if next(group[tostring(msg.chat_id_)]['set_owner']) == nil then 
		text3 = '*No owner in this group*'
		tg.sendMessage(msg.chat_id_, 0, 1, text3, 1, 'md')
	end
    pm = group[tostring(msg.chat_id_)]['set_owner']
    tg.sendMessage(msg.chat_id_, 0, 1,'*owner:* [`'..pm..'`]', 1, 'md')
end]]

local function action_by_reply(arg, data)
	local cmd = arg.cmd
    local group = load_data('bot/group.json')
	if not tonumber(data.sender_user_id_) then return false end
	if data.sender_user_id_ then
		--[[if cmd == "setowner" then
			local function owner_cb(arg, data)
				local group = load_data('bot/group.json')
				if data.username_ then
					user_name = '@'..check_markdown(data.username_)
				else
					user_name = check_markdown(data.first_name_)
				end
				local ownerset = group[tostring(arg.chat_id)]['set_owner'] = [tostring(data.id_)]
				--if group[tostring(arg.chat_id)]['set_owner'] = [tostring(data.id_)] then
				if ownerset then
					tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *is already a group owner*", 0, "md")
				end
				--group[tostring(arg.chat_id)]['set_owner'] = user_name
				ownerset = user_name
				save_data(_config.group.data, group)
				tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *added as owner*", 0, "md")
			end
			tdcli_function ({
			ID = "GetUser",
			user_id_ = data.sender_user_id_
			}, owner_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
		end]]
		if cmd == "promote" then
			local function promote_cb(arg, data)
				local group = load_data('bot/group.json')
				if data.username_ then
					user_name = '@'..check_markdown(data.username_)
				else
					user_name = check_markdown(data.first_name_)
				end
				if group[tostring(arg.chat_id)]['moderators'][tostring(data.id_)] then
					tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *is already a moderator*", 0, "md")
				--end
				else 
					group[tostring(arg.chat_id)]['moderators'][tostring(data.id_)] = user_name 				
					save_data(_config.group.data, group)
					tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *has been promoted*", 0, "md")
				end
			end
			tdcli_function ({
			ID = "GetUser",
			user_id_ = data.sender_user_id_
			}, promote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
		end
		if cmd == "demote" then
			local function demote_cb(arg, data)
				local group = load_data('bot/group.json')
				if data.username_ then
					user_name = '@'..check_markdown(data.username_)
				else
					user_name = check_markdown(data.first_name_)
				end
				if not group[tostring(arg.chat_id)]['moderators'][tostring(data.id_)] then
					tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."] *is not a moderator*", 0, "md")
				--end
				else 
					group[tostring(arg.chat_id)]['moderators'][tostring(data.id_)] = nil 				
                                        save_data(_config.group.data, group)
				        tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *has been demoted*", 0, "md")
				end        		
 			end
                        tdcli_function ({
			ID = "GetUser",
			user_id_ = data.sender_user_id_
			}, demote_cb, {chat_id=data.chat_id_,user_id=data.sender_user_id_})
		end
	else
		tg.sendMessage(data.chat_id_, "", 0, "*User dose not exist*", 0, "md")
	end
end

local function action_by_username(arg, data)
	local cmd = arg.cmd
        local group = load_data('bot/group.json')
	if not arg.username then return false end
	if data.id_ then
		if data.type_.user_.username_ then
			user_name = '@'..check_markdown(data.type_.user_.username_)
		else
			user_name = check_markdown(data.title_)
		end
		--[[if cmd == "setowner" then
		    local ownerset1 = group[tostring(arg.chat_id)]['set_owner'] = [tostring(data.id_)]
			--if group[tostring(arg.chat_id)]['set_owner'] = [tostring(data.id_)] then
			if ownerset1 then
				tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *is already a group owner*", 0, "md")
			end
			--group[tostring(arg.chat_id)]['set_owner'] = user_name
			ownerset1 = user_name
			save_data(_config.group.data, group)
			tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *added as owner*", 0, "md")
		end]]
		if cmd == "promote" then
			if group[tostring(arg.chat_id)]['moderators'][tostring(data.id_)] then
				tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *is already a moderator*", 0, "md")
			--end
			else 
				group[tostring(arg.chat_id)]['moderators'][tostring(data.id_)] = user_name 				
				save_data(_config.group.data, group)
				tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *has been promoted*", 0, "md")
			end
		end
		if cmd == "demote" then
			if not group[tostring(arg.chat_id)]['moderators'][tostring(data.id_)] then
				tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *is not a moderator*", 0, "md")
			--end
			else 
				group[tostring(arg.chat_id)]['moderators'][tostring(data.id_)] = nil 				
				save_data(_config.group.data, group)
				tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *has been demoted*", 0, "md")
			end	
		end
	else
		tg.sendMessage(arg.chat_id, "", 0, "*User dose not exist", 0, "md")
	end
end

local function action_by_id(arg, data)
	local cmd = arg.cmd
    local group = load_data('bot/group.json')
	if not tonumber(arg.user_id) then return false end
	if data.id_ then	
		if data.first_name_ then
			if data.username_ then
				user_name = '@'..check_markdown(data.username_)
			else
				user_name = check_markdown(data.first_name_)
			end
			--[[if cmd == "setowner" then
			    local ownerset2 = group[tostring(arg.chat_id)]['set_owner'] = [tostring(data.id_)]
				if ownerset2 then
					tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *is already a group owner*", 0, "md")
				end
				--group[tostring(arg.chat_id)]['set_owner'] = user_name
				ownerset2 = user_name
				save_data(_config.group.data, group)
				tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *added as owner*", 0, "md")
			end]]
			if cmd == "promote" then
				if group[tostring(arg.chat_id)]['moderators'][tostring(data.id_)] then
					tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *is already a moderator*", 0, "md")
				--end
				else 
					group[tostring(arg.chat_id)]['moderators'][tostring(data.id_)] = user_name  					
					save_data(_config.group.data, group)
					tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *has been promoted*", 0, "md")
				end
			end
			if cmd == "demote" then
				if not group[tostring(arg.chat_id)]['moderators'][tostring(data.id_)] then
					tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *is not a moderator*", 0, "md")
				--end
				else 
					group[tostring(arg.chat_id)]['moderators'][tostring(data.id_)] = nil 					
					save_data(_config.group.data, group)
					tg.sendMessage(arg.chat_id, "", 0, "[`"..data.id_.."`] *has been demoted*", 0, "md")
				end		
			end
		else
			tg.sendMessage(arg.chat_id, "", 0, "*User dose not exist*", 0, "md")
		end
	else
		tg.sendMessage(arg.chat_id, "", 0, "*User dose not exist*", 0, "md")
	end
end

local function run(msg, matches)
    local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	local chat = msg.chat_id_
	local user = msg.sender_user_id_
	--[[if matches[1] == "modlist" and is_owner(msg) or is_momod(msg) and addgroup then
		modlist(msg)
	end]]	
        if addgroup then
		--[[if matches[1] == "setowner" and is_owner(msg) then
			if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
				tdcli_function ({
				ID = "GetMessage",
				chat_id_ = msg.chat_id_,
				message_id_ = msg.reply_to_message_id_
				}, action_by_reply, {chat_id=msg.chat_id_,cmd="setowner"})
			end
			if matches[2] and string.match(matches[2], '^%d+$') then
				tdcli_function ({
				ID = "GetUser",
				user_id_ = matches[2],
				}, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="setowner"})
			end
			if matches[2] and not string.match(matches[2], '^%d+$') then
				tdcli_function ({
				ID = "SearchPublicChat",
				username_ = matches[2]
				}, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="setowner"})
			end
		end]]
		if matches[1] == "promote" and is_owner(msg) then
			if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
				tdcli_function ({
				ID = "GetMessage",
				chat_id_ = msg.chat_id_,
				message_id_ = msg.reply_to_message_id_
				}, action_by_reply, {chat_id=msg.chat_id_,cmd="promote"})
			end
			if matches[2] and string.match(matches[2], '^%d+$') then
				tdcli_function ({
				ID = "GetUser",
				user_id_ = matches[2],
				}, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="promote"})
			end
			if matches[2] and not string.match(matches[2], '^%d+$') then
				tdcli_function ({
				ID = "SearchPublicChat",
				username_ = matches[2]
				}, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="promote"})
			end
		end
		if matches[1] == "demote" and is_owner(msg) then
			if not matches[2] and tonumber(msg.reply_to_message_id_) ~= 0 then
				tdcli_function ({
				ID = "GetMessage",
				chat_id_ = msg.chat_id_,
				message_id_ = msg.reply_to_message_id_
				}, action_by_reply, {chat_id=msg.chat_id_,cmd="demote"})
			end
			if matches[2] and string.match(matches[2], '^%d+$') then
				tdcli_function ({
				ID = "GetUser",
				user_id_ = matches[2],
				}, action_by_id, {chat_id=msg.chat_id_,user_id=matches[2],cmd="demote"})
			end
			if matches[2] and not string.match(matches[2], '^%d+$') then
				tdcli_function ({
				ID = "SearchPublicChat",
				username_ = matches[2]
				}, action_by_username, {chat_id=msg.chat_id_,username=matches[2],cmd="demote"})
			end
		end
		--[[if matches[1] == "owner" and is_owner(msg) then
			return ownerlist(msg)
		end]]
		
	end	
end

return {
patterns ={
	--"^[!#/]([Ss]etowner)$",
	--"^[!#/]([Ss]etowner) (.*)$",
	"^[!#/]([Pp]romote)$",
	"^[!#/]([Pp]romote) (.*)$",
	"^[!#/]([Dd]emote)$",
	"^[!#/]([Dd]emote) (.*)$",
	--"^[!#/]([Mm]odlist)$",
	--"^[!#/]([Oo]wner)$",
},
run=run,
}

--bot.lua

--    if data[tostring(msg.to.id)]['set_owner'] then
--      if data[tostring(msg.to.id)]['set_owner'] == tostring(user) then

--bot.lua	  
