local function run(msg)
	local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	local chat = msg.chat_id_
	local user = msg.sender_user_id_
	local TIME_CHECK = 1
	if addgroup and not is_momod(msg) or not is_owner(msg) then 
		local flood = group[tostring(chat)]['settings']['lock_flood']
		if flood == 'yes' then
			local hash = 'user:'..user..':msgs'
			--local hash = 'user:'..user..':'..chat..':msgs'
			local msgs = tonumber(redis:get(hash) or 0)
			local NUM_MSG_MAX = 5
			--[[if addgroup then
				if group[tostring(chat)]['settings']['num_msg_max'] then
					NUM_MSG_MAX = tonumber(group[tostring(chat)]['settings']['num_msg_max'])
				end
			end]]
			if msgs > NUM_MSG_MAX then
				if is_momod(msg) or is_owner(msg) then
					return
				end
				--[[if redis:get('sender:'..user..':lock_floods') then
					return
				else]]
					--tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
					tg.deleteMessages(msg.chat_id_, msg.id_ )
					--kick_user(msg.chat_id_,msg.sender_user_id_)
					--tg.sendMessage(msg.chat_id_, msg.id_, 0, '[`'..user..'`] *has been kicked because of spam flooding*\n\n`Channel:` @LeaderCh', 0, 'md')
					tg.sendMessage(msg.chat_id_, msg.id_, 0, '[`'..user..'`] *has been all deleted messages of spam flooding*\n\n`Channel:` @LeaderCh', 0, 'md')
					redis:setex('sender:'..user..':lock_flood', 30, true)
				--end
			end
			redis:setex(hash, TIME_CHECK, msgs+1)
		end
	end	
end
return {
  patterns = {
    "^(.*)$",
  },
  run = run
}
