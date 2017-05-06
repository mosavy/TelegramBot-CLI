local function addword(msg, name)
    local hash = 'chat:'..msg.chat_id_..':badword'
    redis:hset(hash, name, 'newword')
    tg.sendMessage(msg.chat_id_, msg.id_, 1, '*[* '..name..' *] added to filtered words list*\n\n`Channel:` @LeaderCh', 1, 'md')
end

local function get_badword_hash(msg)
    return 'chat:'..msg.chat_id_..':badword'
end 

local function list_badwords(msg)
	local hash = get_badword_hash(msg)
	local result=''
	if hash then
		local names = redis:hkeys(hash)
		filterlist = '*List of filtered words:*\n-------------------------------------------\n'
		for i=1, #names do
			local a = 1
			filter_list = filterlist .. a ..'-' ..names[i]..'\n'
			a = a + 1
			 = i + 1
		end
		if #filter_list>0 then
			pm = filter_list..'-------------------------------------------\n`Channel:` @LeaderCh'
                        tg.sendMessage(msg.chat_id_, msg.id_, 1, pm, 1, 'md')
		else
			       pm1 = "*Filtered words list is empty*\n\nChannel: @LeaderCh"
                               tg.sendMessage(msg.chat_id_, msg.id_, 1, pm1, 1, "md")
		end
	end
end

local function clear_badwords(msg, var_name) 
	local hash = get_badword_hash(msg)
	redis:del(hash, var_name)
	return '❌لیست کلمات غیرمجاز حذف شد❌'
end

local function list_badword2(msg, arg)
		if msg.text then
	local hash = get_badword_hash(msg)
	if hash then
		local names = redis:hkeys(hash)
		local text = ''
		for i=1, #names do
			if string.match(arg, names[i]) and not is_momod(msg) or not is_owner(msg) then
				tg.deleteMessages(msg.chat_id_, {[0] = msg.id_}, dl_cb, nil)
				return 
			end
		end
	end
	end
end

local function clear_badword(msg, cmd_name)  
	local hash = get_badword_hash(msg)
	redis:hdel(hash, cmd_name)
	tg.sendMessage(msg.chat_id_, msg.id_, 1, '*[* '..cmd_name..' *] removed from filtered words list*\n\n`Channel:` @LeaderCh', 1, 'md')
end

local function pre_process(msg)
	msg.text = msg.content_.text_
	if msg.text or msg.content_.caption_ then
	local hash = get_badword_hash(msg)
	if hash then
		local names = redis:hkeys(hash)
		local text = ''
		for i=1, #names do
			if string.match(tostring(msg.content_.text_), tostring(names[i])) and not is_momod(msg) or not is_owner(msg) then
					tg.deleteMessages(msg.chat_id_, {[0] = msg.id_}, dl_cb, nil)
				return 
			end
			if string.match(tostring(msg.content_.caption_), tostring(names[i])) and not is_momod(msg) or not is_owner(msg) then
					tg.deleteMessages(msg.chat_id_, {[0] = msg.id_}, dl_cb, nil)
				return 
			end
		end
		end
	end
end

local function run(msg, matches)
local group = load_data('bot/group.json')
local addgroup = group[tostring(msg.chat_id)]
	if addgroup and is_momod(msg) or is_owner(msg) then
		if matches[1] == 'filter' then
			local name = string.sub(matches[2], 1, 50)
			local text = addword(msg, name)
			return text
		end
		if matches[1] == 'filterlist' then
			return list_badwords(msg)
		elseif matches[1] == 'clean' then
			local number = '1'
			return clear_badwords(msg, number)
		elseif matches[1] == 'unfilter' then
			return clear_badword(msg, matches[2])
		end
	end
end

return {
  patterns = {
		"^[#!/]([Ff]ilter) (.*)$",
		"^[#!/]([Uu]nfilter) (.*)$",
		"^[#!/]([Ff]ilterlist)$",
                "^[!/#]([Cc]lean) ([Ff]ilterlist)$"
  },
  run = run, 
  pre_process = pre_process
}

