local function pre_process(msg)
	local hash = 'mute_time:'..msg.chat_id_
	local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]	
	if redis:get(hash) and addgroup and not is_owner(msg) or not is_momod(msg)  then
		tg.deleteMessages(msg.chat_id_, {[0] = tonumber(msg.id_)})
	end
end
 
local function run(msg, matches)
	local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	if addgroup and is_owner(msg) or is_momod(msg) then
		if matches[1]:lower() == 'mute all' and matches[2] then
			local hash = 'mute_time:'..msg.chat_id_
			local hour = string.gsub(matches[2], 'h', '')
			local num1 = tonumber(hour) * 3600
			local num4 = tonumber(num1)
			redis:setex(hash, num4, true)
			pm = '*Group to time* `'..matches[2]..'` *hour closed*\n\n`Channel:` @LeaderCh'
			tg.sendMessage(msg.chat_id_, msg.id_, 1, pm, 1, 'md')
		end
		if matches[1]:lower() == 'unmute all' then
			local hash = 'mute_time:'..msg.chat_id_
			redis:del(hash)
			--pm1 = "*✅گروه برای ارسال پیام کاربران باز شد.*"
			--tg.sendMessage(msg.chat_id_, msg.id_, 1, pm1, 1, "md")
		end
	end	
end
return {
	patterns = {
		'^[/!#]([Uu]nmute all)$',
		'^[/!#]([Mm]ute all) (%d+)$',
	},
	run = run,
	pre_process = pre_process
}