--lock.lua
local function lock_group_webpage(msg, target)
	local group = load_data('bot/group.json')
	local group_webpage_lock = group[tostring(target)]['settings']['lock_webpage']
	if group_webpage_lock == 'yes' then
		pm = '*Send webpage is already locked*\n\n`Channel:` @LeaderCh'
		tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
	else
		group[tostring(target)]['settings']['lock_webpage'] = 'yes'
		save_data(_config.group.data, group)
		pm= '*Send webpage has been locked*\n\n`Channel:` @LeaderCh'
		tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
	end
end

local function unlock_group_webpage(msg, target)
	local group = load_data('bot/group.json')
	local group_webpage_lock = group[tostring(target)]['settings']['lock_webpage']
	if group_webpage_lock == 'no' then
		pm = '*Send webpage is not locked*\n\n`Channel:` @LeaderCh'
		tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
	else
		group[tostring(target)]['settings']['lock_webpage'] = 'no'
		save_data(_config.group.data, group)
		pm= '*Send webpage has been unlocked*\n\n`Channel:` @LeaderCh'
		tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
	end
end


local function lock_group_markdown(msg, target)
	local group = load_data('bot/group.json')
	local group_markdown_lock = group[tostring(target)]['settings']['lock_markdown']
	if group_markdown_lock == 'yes' then
		pm = '*Send markdown is already locked*\n\n`Channel:` @LeaderCh'
		tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
	else
		group[tostring(target)]['settings']['lock_markdown'] = 'yes'
		save_data(_config.group.data, group)
		pm= '*Send markdown has been locked*\n\n`Channel:` @LeaderCh'
		tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
	end
end

local function unlock_group_markdown(msg, target)
	local group = load_data('bot/group.json')
	local group_markdown_lock = group[tostring(target)]['settings']['lock_markdown']
	if group_markdown_lock == 'no' then
		pm = '*Send markdown is not locked*\n\n`Channel:` @LeaderCh'
		tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
	else
		group[tostring(target)]['settings']['lock_markdown'] = 'no'
		save_data(_config.group.data, group)
		pm= '*Send markdown has been unlocked*\n\n`Channel:` @LeaderCh'
		tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
	end
end
--lock.lua
--------------------------------------------------------------------------------------------
--(run)lock.lua
		elseif matches[2] == 'webpage' then
			lock_group_webpage(msg, msg.chat_id)
		elseif matches[2] == 'markdown' then
			lock_group_markdown(msg, msg.chat_id)


			
		elseif matches[2] == 'webpage' then
			unlock_group_webpage(msg, msg.chat_id)
		elseif matches[2] == 'markdown' then
			unlock_group_markdown(msg, msg.chat_id)			
--(run)lock.lua
--------------------------------------------------------------------------------------------
--msg-checks.lua
if msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
    local group_lock_webpage = group[tostring(msg.chat_id)]['settings']['lock_webpage']
	if group_lock_webpage == 'yes' then
		tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
	end
end 

if msg.content_.entities_[0].ID == "MessageEntityBold" or msg.content_.entities_[0].ID == "MessageEntityCode" or msg.content_.entities_[0].ID == "MessageEntityPre" or msg.content_.entities_[0].ID == "MessageEntityItalic" then
	local group_lock_markdown = group[tostring(msg.chat_id)]['settings']['lock_markdown']
	if group_lock_markdown == 'yes' then
		tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
	end
end
--msg-checks.lua
--------------------------------------------------------------------------------------------
--addrem.lua
lock_webpage = "no",
lock_markdown = "no",
--addrem.lua