local function pre_process(msg)
	local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	if addgroup and not is_momod(msg) or not is_owner(msg) --[[and msg.content_.caption_]] then
		--if msg.text then
			if is_filter(msg, msg.text) then
				--tg.deleteMessages(msg.chat_id_, tonumber(msg.id_))
				tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
			end
		--end
	end
end

local function filter_word(msg, word)
	local group = load_data('bot/group.json')
	if not group[tostring(msg.chat_id_)]['filterlist'] then
		group[tostring(msg.chat_id_)]['filterlist'] = {}
		save_data(_config.group.data, group)
    end
	if group[tostring(msg.chat_id_)]['filterlist'][(word)] then
		tg.sendMessage(msg.chat_id_, 0, 1, '*[* '..word..' *] is already filtered*\n\n`Channel:` @LeaderCh', 1, 'md')
	--end
	else
	group[tostring(msg.chat_id_)]['filterlist'][(word)] = true
	save_data(_config.group.data, group)
	tg.sendMessage(msg.chat_id_, 0, 1, '*[* '..word..' *] added to filtered words list*\n\n`Channel:` @LeaderCh', 1, 'md')
	end
end

local function unfilter_word(msg, word)
	local group = load_data('bot/group.json')
	if not group[tostring(msg.chat_id_)]['filterlist'] then
		group[tostring(msg.chat_id_)]['filterlist'] = {}
		save_data(_config.group.data, group)
    end
    if group[tostring(msg.chat_id_)]['filterlist'][word] then
		group[tostring(msg.chat_id_)]['filterlist'][(word)] = nil
		save_data(_config.group.data, group)
		tg.sendMessage(msg.chat_id_, 0, 1, '*[* '..word..' *] removed from filtered words list*\n\n`Channel:` @LeaderCh', 1, 'md')
	else
		tg.sendMessage(msg.chat_id_, 0, 1, '*[* '..word..' *] is not filtered*\n\n`Channel:` @LeaderCh', 1, 'md')
	end
end

function filter_list(msg)
    local group = load_data('bot/group.json')
	if not group[tostring(msg.chat_id_)]['filterlist'] then
		group[tostring(msg.chat_id_)]['filterlist'] = {}
		save_data(_config.group.data, group)
    end
	if next(group[tostring(msg.chat_id_)]['filterlist']) == nil then
		tg.sendMessage(msg.chat_id_, 0, 1, '*Filtered words list is empty*\n\n`Channel:` @LeaderCh', 1, 'md')
	end
	if not group[tostring(msg.chat_id_)]['filterlist'] then
		group[tostring(msg.chat_id_)]['filterlist'] = {}
		save_data(_config.group.data, group)
    end
    filterlist = '*List of filtered words :*\n'
	local i = 1
	for k,v in pairs(group[tostring(msg.chat_id_)]['filterlist']) do
		filterlist = filterlist..'*'..i..'-* '..k..'\n'
        i = i + 1
    end
    tg.sendMessage(msg.chat_id_, 0, 1, filterlist..'---------------------------------------------------\n`Channel:` @LeaderCh', 1, 'md')
end

local function run(msg, matches)
    local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
	if addgroup and is_momod(msg) or is_owner(msg) then
		if matches[1] == 'filter' then
		    --[[text1 = matches[2]
			filter_word(msg, text1)]]
			filter_word(msg, matches[2])
		end
		if matches[1] == 'unfilter' then
			--[[text2 = matches[2]
			unfilter_word(msg, text2)]]
			unfilter_word(msg, matches[2])
		end
		if matches[1] == 'filterlist' then
			filter_list(msg)
		end
	end
end

return {
	patterns ={
		"^[#!/]([Ff]ilter) (.*)$",
		"^[#!/]([Uu]nfilter) (.*)$",
		"^[#!/]([Ff]ilterlist)$",
	},
	run=run,
	pre_process = pre_process
}
