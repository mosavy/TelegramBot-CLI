--run(lock.lua)
	if matches[1] == 'setflood' then
		if tonumber(matches[2]) < 3 or tonumber(matches[2]) > 20 then
			tg.sendMessage(msg.chat_id_, msg.id_, 1, '*More than* `3` *and less than* `20`\n\n`Channel:` @LeaderCh', 1, 'md')
		end
		local flood_max = matches[2]
		group[tostring(chat)]['settings']['num_msg_max'] = flood_max
		save_data(_config.group.data, group)
		textpm = '*SuperGroup flood sensitivity has been set:* `'..matches[2]..'`'
		tg.sendMessage(msg.chat_id_, msg.id_, 1, textpm, 1, 'md')
    end
--run(lock.lua)

-------------------------------------------------------------------------------------------------------------
--lock.lua
local group = load_data('bot/group.json')
--local target = msg.chat_id_
--if group[tostring(msg.chat_id)] then 	
	if group[tostring(target)]['settings']['num_msg_max'] then 	
		NUM_MSG_MAX = tonumber(data[tostring(target)]['settings']['num_msg_max'])
		print('custom'..NUM_MSG_MAX) 	
	else 	
		NUM_MSG_MAX = 5
	end
--end	
--lock.lua

-------------------------------------------------------------------------------------------------------------
--bot.lua
function gp_type(chat_id)
	local gp_type = "pv"
	return gp_type
end
--bot.lua

-------------------------------------------------------------------------------------------------------------
--msg-checks.lua
local TIME_CHECK = 2
------------------------
local user = msg.sender_user_id_
local chat = msg.chat_id_
if gp_type(chat) ~= 'pv' then
	local group_lock_flood = group[tostring(msg.chat_id)]['settings']['lock_flood']
	if group_lock_flood == 'yes' then
		local hash = 'user:'..user..':msgs'
		local msgs = tonumber(redis:get(hash) or 0)
        local NUM_MSG_MAX = 5
		if group[tostring(msg.chat_id)] then
			if group[tostring(msg.chat_id)]['settings']['num_msg_max'] then
				NUM_MSG_MAX = tonumber(group[tostring(msg.chat_id)]['settings']['num_msg_max'])
			end
        end
		if msgs > NUM_MSG_MAX then
			if is_momod(msg) or is_owner(msg) then
				return
			end
			local adduser = msg.text:match("!!!tgservice:adduser")
			if adduser then
				return
			end
			if redis:get('sender:'..user..':lock_flood') then
				return
			else
				--tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
				tg.deleteMessages(msg.chat_id_, msg.id_)
				kick_user(chat, user)
				tg.sendMessage(msg.chat_id_, msg.id_, 0, '*[*` '..user..' `*] has been kicked because of spam flooding*\n\n`Channel:` @LeaderCh', 0, "md")
				redis:setex('sender:'..user..':lock_flood', 30, true)
			end
		end
		redis:setex(hash, TIME_CHECK, msgs+1)
    end
end
--msg-checks.lua

	
	