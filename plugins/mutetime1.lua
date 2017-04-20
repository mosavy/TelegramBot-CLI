local function pre_process(msg)
	local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	local hash = 'mute_time:'..msg.chat_id_
	if redis:get(hash) and addgroup and not is_momod(msg) or not is_owner(msg) then
		tg.deleteMessages(msg.chat_id_, {[0] = tonumber(msg.id_)})
	end
end
 
local function run(msg, matches
	local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	if addgroup and is_momod(msg) or is_owner(msg) then
		if matches[1]:lower() == 'mutetime' then
			local hash = 'mute_time:'..msg.chat_id_
			--if matches[2] and matches[3] then
			--if not matches[2] then
			--	return ":لطفا ساعت و دقیقه را وارد نمایید"
			--else
				local hour = string.gsub(matches[2], 'h', '')
				local num1 = tonumber(hour) * 3600
				local minutes = string.gsub(matches[3], 'm', '')
				local num2 = tonumber(minutes) * 60
				local num4 = tonumber(num1 + num2)
				redis:setex(hash, num4, true)
				pm1 = "*Group to time:* \n`"..matches[2].."` hour *and* `"..matches[3].."` minutes *closed*\n\n`Channel:` @LeaderCh"
				tg.sendMessage(msg.chat_id_, msg.id_, 1, pm1, 1, "md")
			--end
		end
		if matches[1]:lower() == 'unmutetime' then
			local hash = 'mute_time:'..msg.chat_id_
			redis:del(hash)
			pm2 = "*Group has been successfully from mute exited*\n\n`Channel:` @LeaderCh"
			tg.sendMessage(msg.chat_id_, msg.id_, 1, pm2, 1, "md")
		end
	end	
end
return {
	patterns = {
		--'^[/!#]([Mm]ute)$',
		'^[/!#]([Uu]nmutetime)$',
		'^[/!#]([Mm]utetime) (%d+) (%d+)$',
	},
	run = run,
	pre_process = pre_process
}
