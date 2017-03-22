local function run(msg, matches)
	local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	if addgroup and is_momod(msg) or is_owner(msg) then
		if matches[1] == 'clean' and matches[2] == 'bot' then
			--if matches[2] == 'bot' then	
				function clbot(arg, data)
					for k, v in pairs(data.members_) do
						kick_user(v.user_id_, msg.to.id)
					end
					tg.sendMessage(msg.to.id, msg.id, 1, '*All Bots was cleared*\n\n`Channel:` @LeaderCh', 1, 'md')
				end
				tg.getChannelMembers(msg.to.id, 0, 'Bots', 200, clbot, nil)
				
			--[[elseif matches[2] == 'modlist' then
				if next(group[tostring(msg.chat_id_)]['moderators']) == nil then
					tg.sendMessage(msg.chat_id_, msg.id_, 1,'*Mod list is empty*\n\n`Channel:` @LeaderCh', 1, 'md')
				end
				for k,v in pairs(group[tostring(msg.chat_id_)]['moderators']) do
					group[tostring(msg.chat_id_)]['moderators'][tostring(k)] = nil
					save_data(_config.group.data, group)
				end
				tg.sendMessage(msg.chat_id_, msg.id_, 1, '*Mod list has been cleaned*\n\n`Channel:` @LeaderCh', 1, 'md')
				
			elseif matches[2] == 'filterlist' then
				if next(group[tostring(msg.chat_id_)]['filterlist']) == nil then
					tg.sendMessage(msg.chat_id_, msg.id_, 1, '*Filter list is empty*\n\n`Channel:` @LeaderCh', 1, 'md')
				end
				for k,v in pairs(group[tostring(msg.chat_id_)]['filterlist']) do
					group[tostring(msg.chat_id_)]['filterlist'][tostring(k)] = nil
					save_data(_config.group.data, group)
				end
				tg.sendMessage(msg.chat_id_, msg.id_, 1, '*Filter list has been cleaned*\n\n`Channel:` @LeaderCh', 1, 'md')
			end]]
		end
	end		
end

return { 
	patterns ={ 
		'^[/!#]([Cc]lean) (bot)$'
		'^[/!#]([Cc]lean) (.*)$',
	},
	run = run
}