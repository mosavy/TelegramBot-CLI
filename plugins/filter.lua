local function pre_process(msg)
	local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	if addgroup and not is_owner(msg) or not is_momod(msg) then
		if is_momod(msg) or is_robot(msg) then
			return false
		else
			if msg.content_.text_ then
				if is_filter(msg, msg.content_.text_) then
					--tg.deleteMessages(msg.chat_id_, msg.id_)
					tg.deleteMessages(msg.chat_id_, tonumber(msg.id_))
					--tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
				end
			end
			--[[elseif msg.content_.caption_ then
				if is_filter(msg, msg.content_.caption_) then
					--tg.deleteMessages(msg.chat_id_, msg.id_)
					tg.deleteMessages(msg.chat_id_, tonumber(msg.id_))
					--tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
				end	
			end]]	
		end

	end	
end

function filter_list(msg)
    local group = load_data('bot/group.json')
    if not group[tostring(msg.chat_id_)]['filterlist'] then
       group[tostring(msg.chat_id_)]['filterlist'] = {}
       save_data(_config.group.data, group)
    end
    -- determine if table is empty
    if next(group[tostring(msg.chat_id_)]['filterlist']) == nil then --fix way
       pm1 = "*Filtered words list is empty*\n\nChannel: @LeaderCh"
       tg.sendMessage(msg.chat_id_, msg.id_, 1, pm1, 1, "md")
    end
    if not group[tostring(msg.chat_id_)]['filterlist'] then
       group[tostring(msg.chat_id_)]['filterlist'] = {}
       save_data(_config.group.data, group)
   -- end
    else	
       filterlist = '*List of filtered words:*\n-------------------------------------------\n'
       local i = 1
       for k,v in pairs(group[tostring(msg.chat_id_)]['filterlist']) do
          filterlist = filterlist..'*'..i..'-* '..check_markdown(k)..'\n'
          i = i + 1
       end
    end	
    pm = filterlist..'-------------------------------------------\nChannel: @LeaderCh'
    tg.sendMessage(msg.chat_id_, msg.id_, 1, pm, 1, 'md')
end

local function filter_word(msg, word)
	local group = load_data('bot/group.json')
	if not group[tostring(msg.chat_id)]['filterlist'] then
		group[tostring(msg.chat_id)]['filterlist'] = {}
		save_data(_config.group.data, group)
	end
	if group[tostring(msg.chat_id)]['filterlist'][(word)] then
		tg.sendMessage(msg.chat_id_, msg.id_, 1, '*[* '..word..' *] is already filtered*\n\n`Channel:` @LeaderCh', 1, 'md')
	--end
	else	
	        group[tostring(msg.chat_id)]['filterlist'][(word)] = true
                save_data(_config.group.data, group)
                tg.sendMessage(msg.chat_id_, msg.id_, 1, '*[* '..word..' *] added to filtered words list*\n\n`Channel:` @LeaderCh', 1, 'md')
        end
end

local function unfilter_word(msg, word)
	local group = load_data('bot/group.json')
	if not group[tostring(msg.chat_id)]['filterlist'] then
		group[tostring(msg.chat_id)]['filterlist'] = {}
		save_data(_config.group.data, group)
    end
    if group[tostring(msg.chat_id)]['filterlist'][word] then
		group[tostring(msg.chat_id)]['filterlist'][(word)] = nil
		save_data(_config.group.data, group)
		tg.sendMessage(msg.chat_id_, msg.id_, 1, '*[* '..word..' *] removed from filtered words list*\n\n`Channel:` @LeaderCh', 1, 'md')
    else
		tg.sendMessage(msg.chat_id_, msg.id_, 1, '*[* '..word..' *] is not filtered*\n\n`Channel:` @LeaderCh', 1, 'md')
	end
end

local function run(msg, matches)
	local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	if addgroup and is_owner(msg) or is_momod(msg) then
		if matches[1] == 'filter' then
			return filter_word(msg, matches[2])
		end
		if matches[1] == 'unfilter' then
			return unfilter_word(msg, matches[2])
		end
		if matches[1] == 'filterlist' then
			return filter_list(msg)
		end
	end
end
 
return {
	patterns ={
		"^[#!/]([Ff]ilter) (.*)$",
		"^[#!/]([Uu]nfilter) (.*)$",
		"^[#!/]([Ff]ilterlist)$"
	},
	run=run,
	pre_process=pre_process
}
