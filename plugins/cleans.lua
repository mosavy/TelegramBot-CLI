local function run(msg, matches)
	local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	if addgroup and is_owner(mag) then
		if matches[1] == 'clean' then
			if matches[2] == 'modlist' then
				if next(group[tostring(msg.chat_id)]['moderators']) == nil then
					tg.sendMessage(msg.chat_id_, msg.id_, 1,'*Not moderators in this supergroup*\n\n`Channel:` @LeaderCh', 1, 'md')
				end
				for k,v in pairs(group[tostring(msg.chat_id)]['moderators']) do
					group[tostring(msg.chat_id)]['moderators'][tostring(k)] = nil
					save_data(_config.group.data, group)
				end
				tg.sendMessage(msg.chat_id_, msg.id_, 1,'*All moderators has been demoted*\n\n`Channel:` @LeaderCh', 1, 'md')
			end
			--[[if matches[2] == 'filterlist' then
				if next(group[tostring(chat)]['filterlist']) == nil then
					tg.sendMessage(msg.chat_id_, 0, 1, '*Words filter list is empty*\n\n`Channel:` @LeaderCh', 1, 'md')
				end
				for k,v in pairs(group[tostring(chat)]['filterlist']) do
					group[tostring(chat)]['filterlist'][tostring(k)] = nil
					save_data(_config.group.data, group)
				end
				tg.sendMessage(msg.chat_id_, 0, 1, '*Filter list has been cleaned*\n\n`Channel:` @LeaderCh', 1, 'md')
			end
			if matches[2] == 'rules' then
				if redis:scard('rules'..msg.chat_id_) == 0 then
					tg.sendMessage(msg.chat_id_, 0, 1, '*Rules not been saved*\n\n`Channel:` @LeaderCh', 1, 'md')
				end
				redis:del('rules'..msg.chat_id_)
				--save_data(_config.group.data, group)
				tg.sendMessage(msg.chat_id_, 0, 1, '*Rules has been cleaned*\n\n`Channel:` @LeaderCh', 1, 'md')
			end
			if matches[2] == 'welcome' then
				if not group[tostring(chat)]['setwelcome'] then
					tg.sendMessage(msg.chat_id_, 0, 1, '*Welcome message not been saved*\n\n`Channel:` @LeaderCh', 1, 'md')
				end
				group[tostring(chat)]['setwelcome'] = nil
				save_data(_config.group.data, group)
				tg.sendMessage(msg.chat_id_, 0, 1, '*Welcome message has been cleaned*\n\n`Channel:` @LeaderCh', 1, 'md')
			end]]
		end
	end
 end
 
return {
	patterns ={
		"^[!/#]([Cc]lean) (modlist)$",
	},
	run=run,
}



