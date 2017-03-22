local function config(msg)
	local group = load_data('bot/group.json')
	local i = 1
	function padmin(extra,result,success)
		function set(arg, data)
			if data.username_ then
				user_name = '@'..check_markdown(data.username_)
			else
				user_name = check_markdown(data.first_name_)
			end
			group[tostring(msg.chat_id_)]['moderators'][tostring(data.id_)] = user_name
			save_data(_config.group.data, group)
		end
		local admins = result.members_
		for i=0 , #admins do
			tg.getUser(admins[i].user_id_,set)
		end
		message = '*All moderators group has been added to Modlist*\n\n`Channel:` @LeaderCh'
		tg.sendMessage(msg.chat_id_,msg.id_, 1,message, 1, 'md')
	end
	tg.getChannelMembers(msg.chat_id_,0,'Administrators',200,padmin)
end

local function run(msg, matches)
	local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	if addgroup and is_owner(msg) or is_momod(msg) then
		if matches[1] == 'modall' then
			return config(msg)
		end
	end	
end

return {
	patterns ={
		'^[!/#]([Mm]odall)$',	
	},
	run=run,
}	