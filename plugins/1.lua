--lock(run)
local group = load_data('bot/group.json')
local chat = msg.chat_id_
if matches[1] == 'setflood' and is_momod(msg) or is_owner(msg) then
	if tonumber(matches[2]) < 1 or tonumber(matches[2]) > 20 then
		tg.sendMessage(msg.chat_id_, 0, 1, '*Wrong number, range is [*`1-20`*]*\n\n`Channel:` @LeaderCh', 1, 'md')
    end
	local flood_max = matches[2]
	group[tostring(chat)]['settings']['num_msg_max'] = flood_max
	save_data(_config.group.data, group)
	tg.sendMessage(msg.chat_id_, 0, 1, '*SuperGroup flood sensitivity has been set to: [* `'..matches[2]..'` *]*\n\n`Channel:` @LeaderCh', 1, 'md')
end
--lock(run)


--lock
local group = load_data('bot/group.json')
local addgroup = group[tostring(msg.chat_id)]
if addgroup then 	
	if group[tostring(target)]["settings"]["num_msg_max"] then 	
		NUM_MSG_MAX = tonumber(group[tostring(target)]['settings']['num_msg_max'])
		print('custom'..NUM_MSG_MAX) 	
	else 	
		NUM_MSG_MAX = 5
	end
end
--lock
-------------------------------------------------------------------------------------------------------

--msg_checks
local TIME_CHECK = 2
local function pre_process(msg)
local chat = msg.chat_id_
local user = msg.sender_user_id_
local group = load_data('bot/group.json')
local addgroup = group[tostring(msg.chat_id)]
if not is_moomd(msg) or not is_owner(msg) or not is_robot(msg) then
	--if msg.content_.caption_ then
		if lock_flood == "yes" then
			local hash = 'user:'..user..':msgs'
			local msgs = tonumber(redis:get(hash) or 0)
			local NUM_MSG_MAX = 5
			if addgroup then
				if group[tostring(chat)]['settings']['num_msg_max'] then
					NUM_MSG_MAX = tonumber(group[tostring(chat)]['settings']['num_msg_max'])
				end
			end
			if msgs > NUM_MSG_MAX then
				if is_momod(msg) or is_owner(msg) or is_robot(msg) then
					return
				end
				local is_adduser = msg.text:match("!!!tgservice:")
				if is_adduser then
					return
				end
				if redis:get('sender:'..user..':flood') then
					return
				else
					tg.deleteMessages(msg.chat_id_, msg.id_)
					kick_user(chat, user)
					tg.sendMessage(msg.chat_id_, msg.id_, 0, '*[* `'..user..'` *] has been kicked because of spam flooding*\n\n`Channel:` @LeaderCh', 0, 'md')
					redis:setex('sender:'..user..':flood', 30, true)
				end
			end
			redis:setex(hash, TIME_CHECK, msgs+1)
		end
	--end
end

return {
	patterns = {},
	pre_process = pre_process
}
--msg_checks


--bot
	elseif msg.content_.ID == "MessageChatAddMembers" then
		msg.text = "!!!tgservice:"
--bot	