--lock
local function lock_group_number(msg, target)
local group = load_data('bot/group.json')
  local group_link_lock = group[tostring(target)]['settings']['lock_number']
  if group_link_lock == 'yes' then
    pm = '*Send number is already locked*\n*Channel:* @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_number'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Send number has been locked*\n*Channel:* @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end

local function unlock_group_number(msg, data, target)
local group = load_data('bot/group.json')
  local group_tgservice_lock = group[tostring(target)]['settings']['lock_number']
  if group_tgservice_lock == 'no' then
    pm = '*Send number is not locked*\n*Channel:* @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_number'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Send number has been unlocked*\n*Channel:* @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end

local function lock_group_emogi(msg, target)
local group = load_data('bot/group.json')
  local group_link_lock = group[tostring(target)]['settings']['lock_emogi']
  if group_link_lock == 'yes' then
    pm = '*Send emogi is already locked*\n*Channel:* @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_emogi'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Send emogi has been locked*\n*Channel:* @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end

local function unlock_group_emogi(msg, data, target)
local group = load_data('bot/group.json')
  local group_tgservice_lock = group[tostring(target)]['settings']['lock_emogi']
  if group_tgservice_lock == 'no' then
    pm = '*Send emogi is not locked*\n*Channel:* @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_emogi'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Send emogi has been unlocked*\n*Channel:* @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
--lock

--settings
pm = pm..'\n21- <code>Lock Number</code> : '..group[tostring(target)]['settings']['lock_number']..''
pm = pm..'\n22- <code>Lock Emogi</code> : '..group[tostring(target)]['settings']['lock_emogi']..''
pm = pm..'\n23- <code>Lock Audio</code> : '..group[tostring(target)]['settings']['mute_audio']..'\n-------------------------------------------'
pm = pm..'\n24- <code>Mute All</code> : '..group[tostring(target)]['settings']['mute_all']..''
pm = pm..'\n-------------------------------------------\n<b>Channel: </b>@LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
end
--settings

--msg_checks
local group_emogi_lock = group[tostring(msg.chat_id)]['settings']['lock_emogi']
local is_emogi_msg = msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("")
if group_emogi_lock == 'yes' and is_emoji_msg or emoji2 or emoji3 or emoji5 then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end

local group_number_lock = group[tostring(msg.chat_id)]['settings']['lock_number']
local is_number_msg = msg.text:match("0") or msg.text:match("1") or msg.text:match("2") or msg.text:match("3") or msg.text:match("4") or msg.text:match("5") or msg.text:match("6") or msg.text:match("7") or msg.text:match("8") or msg.text:match("9")
local is_num_msg = msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("") or msg.text:match("")
if group_number_lock == 'yes' and is_number_msg or is_num_msg then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
end
--msg_checks
