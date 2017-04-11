local function run(msg, matches)
	local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	if addgroup and is_owner(mag) then
		if matches[1] == 'clean' and matches[2] == 'modlist' then
			--if matches[2] == 'modlist' then
				if next(group[tostring(msg.chat_id_)]['moderators']) == nil then
					tg.sendMessage(msg.chat_id_, msg.id_, 1,'*Not moderators in this group*\n\n`Channel:` @LeaderCh', 1, 'md')
				end
				for k,v in pairs(group[tostring(msg.chat_id_)]['moderators']) do
					group[tostring(msg.chat_id_)]['moderators'][tostring(k)] = nil
					save_data(_config.group.data, group)
				end
				tg.sendMessage(msg.chat_id_, msg.id_, 1,'*All moderators has been demoted*\n\n`Channel:` @LeaderCh', 1, 'md')
			--end

		end
	end
 end
 
return {
	patterns ={
		"^[!/#]([Cc]lean) (modlist)$"
	},
	run=run,
}



