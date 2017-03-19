--[[local function settings(msg, target,group)
local group = load_data('bot/group.json')
pm = '<b>SuperGroup settings</b>\n-------------------------------------------'
pm = pm..'\n1- <code>Lock Links</code> : '..group[tostring(target)]['settings']['lock_link']..''
pm = pm..'\n2- <code>Lock Username</code> : '..(group[tostring(target)]['settings']['lock_username'] or 'no')..''
pm = pm..'\n3- <code>Lock Tag</code> : '..(group[tostring(target)]['settings']['lock_tag'] or 'no')..''
pm = pm..'\n4- <code>Lock Edit</code> : '..group[tostring(target)]['settings']['lock_edit']..''
pm = pm..'\n5- <code>Lock Fwd</code> : '..(group[tostring(target)]['settings']['lock_fwd'] or 'no')..''
pm = pm..'\n6- <code>Lock Flood</code> : '..(group[tostring(target)]['settings']['lock_flood'] or 'no')..''
pm = pm..'\n7- <code>Lock Fosh</code> : '..(group[tostring(target)]['settings']['lock_fosh'] or 'no')..''
pm = pm..'\n8- <code>Lock Tgservice</code> : '..(group[tostring(target)]['settings']['lock_tgservice'] or 'no')..''
pm = pm..'\n9- <code>Lock Sticker</code> : '..(group[tostring(target)]['settings']['lock_sticker'] or 'no')..''
--pm = pm..'\n10- <code>Lock Contact</code> : '..(group[tostring(target)]['settings']['lock_contact'] or 'no')..''
--pm = pm..'\n11- <code>Lock Location</code> : '..(group[tostring(target)]['settings']['lock_location'] or 'no')..''
--pm = pm..'\n12- <code>Lock Game</code> : '..(group[tostring(target)]['settings']['lock_game'] or 'no')..''
pm = pm..'\n13- <code>Lock Bot</code> : '..(group[tostring(target)]['settings']['lock_bot'] or 'no')..''
pm = pm..'\n14- <code>Lock Inline</code> : '..(group[tostring(target)]['settings']['lock_inline'] or 'no')..''
pm = pm..'\n15- <code>Lock Spam</code> : '..(group[tostring(target)]['settings']['lock_spam'] or 'no')..''
pm = pm..'\n16- <code>Lock English</code> : '..(group[tostring(target)]['settings']['lock_english'] or 'no')..''
pm = pm..'\n17- <code>Lock Arabic</code> : '..(group[tostring(target)]['settings']['lock_persian'] or 'no')..''
--pm = pm..'\n     🔧<b>Mute</b>🔧'
pm = pm..'\n18- <code>Lock Gifs</code> : '..(group[tostring(target)]['settings']['mute_gif'] or 'no')..''
pm = pm..'\n19- <code>Lock Photo</code> : '..(group[tostring(target)]['settings']['mute_photo'] or 'no')..''
pm = pm..'\n20- <code>Lock Video</code> : '..(group[tostring(target)]['settings']['mute_video'] or 'no')..''
pm = pm..'\n21- <code>Lock Voice</code> : '..(group[tostring(target)]['settings']['mute_voice'] or 'no')..''
pm = pm..'\n22- <code>Lock Document</code> : '..(group[tostring(target)]['settings']['mute_document'] or 'no')..''
pm = pm..'\n23- <code>Lock Audio</code> : '..(group[tostring(target)]['settings']['mute_audio'] or 'no')..'\n-------------------------------------------'
pm = pm..'\n24- <code>Mute All</code> : '..(group[tostring(target)]['settings']['mute_all'] or 'no')..''
pm = pm..'\n25- <code>Flood sensitivity</code> : '..NUM_MSG_MAX..''
--pm = pm..'\n25- <code>Flood sensitivity</code> : '..(group[tostring(target)]['settings']['num_msg_max'])''
	
pm = pm..'\n-------------------------------------------\n\n<b>Channel: </b>@LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
end]]
local function lock_group_links(msg, target)
local group = load_data('bot/group.json')
  local group_link_lock = group[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'yes' then
    pm = '*Link posting is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_link'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Link posting has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function lock_group_username(msg, target)
local group = load_data('bot/group.json')
  local group_username_lock = group[tostring(target)]['settings']['lock_username']
  if group_username_lock == 'yes' then
    pm = '*Send Username is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_username'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Send Username has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function lock_group_tag(msg, target)
local group = load_data('bot/group.json')
  local group_tag_lock = group[tostring(target)]['settings']['lock_tag']
  if group_tag_lock == 'yes' then
    pm = '*Send Tag is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_tag'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Send Tag has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function lock_group_english(msg, target)
local group = load_data('bot/group.json')
  local group_english_lock = group[tostring(target)]['settings']['lock_english']
  if group_english_lock == 'yes' then
    pm = '*English is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_english'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*English has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function lock_group_persian(msg, target)
local group = load_data('bot/group.json')
  local group_persian_lock = group[tostring(target)]['settings']['lock_persian']
  if group_persian_lock == 'yes' then
    pm = '*Arabic is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_persian'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Arabic has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function lock_group_flood(msg, target)
local group = load_data('bot/group.json')
  local group_flood_lock = group[tostring(target)]['settings']['lock_flood']
  if group_flood_lock == 'yes' then
    pm = '*Flood is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_flood'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Flood has been locked* \n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function lock_group_fosh(msg, target)
local group = load_data('bot/group.json')
  local group_fosh_lock = group[tostring(target)]['settings']['lock_fosh']
  if group_fosh_lock == 'yes' then
    pm = '*Fosh is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_fosh'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Fosh has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function lock_group_inline(msg, target)
local group = load_data('bot/group.json')
  local group_inline_lock = group[tostring(target)]['settings']['lock_inline']
  if group_inline_lock == 'yes' then
    pm = '*Inline is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_inline'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Inline has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function lock_group_sticker(msg, target)
local group = load_data('bot/group.json')
  local group_sticker_lock = group[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'yes' then
    pm = '*Send Sticker is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_sticker'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Send Sticker has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end

local function lock_group_contact(msg, target)
local group = load_data('bot/group.json')
  local group_contact_lock = group[tostring(target)]['settings']['lock_contact']
  if group_contact_lock == 'yes' then
    pm = '*Send Contact is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_contact'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Send Contact has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function lock_group_location(msg, target)
local group = load_data('bot/group.json')
  local group_location_lock = group[tostring(target)]['settings']['lock_location']
  if group_location_lock == 'yes' then
    pm = '*Send Location is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_location'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Send Location has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function lock_group_game(msg, target)
local group = load_data('bot/group.json')
  local group_game_lock = group[tostring(target)]['settings']['lock_game']
  if group_game_lock == 'yes' then
    pm = '*Send Game is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_game'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Send Game has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end

local function lock_group_bot(msg, target)
local group = load_data('bot/group.json')
  local group_bot_lock = group[tostring(target)]['settings']['lock_bot']
  if group_bot_lock == 'yes' then
    pm = '*Bot api is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_bot'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Bot api has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function lock_group_edit(msg, target)
local group = load_data('bot/group.json')
  local group_edit_lock = group[tostring(target)]['settings']['lock_edit']
  if group_edit_lock == 'yes' then
    pm = '*Edit post is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_edit'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Edit post has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function lock_group_fwd(msg, target)
local group = load_data('bot/group.json')
  local group_fwd_lock = group[tostring(target)]['settings']['lock_fwd']
  if group_fwd_lock == 'yes' then
    pm = '*Forwaed is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_fwd'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Forwaed has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function lock_group_tgservice(msg, target)
local group = load_data('bot/group.json')
  local group_tgservice_lock = group[tostring(target)]['settings']['lock_tgservice']
  if group_tgservice_lock == 'yes' then
    pm = '*Tgservice is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_tgservice'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Tgservice has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end

local function unlock_group_tgservice(msg, data, target)
local group = load_data('bot/group.json')
  local group_tgservice_lock = group[tostring(target)]['settings']['lock_tgservice']
  if group_tgservice_lock == 'no' then
    pm = '*Tgservice is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_tgservice'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Tgservice has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unlock_group_links(msg, target)
local group = load_data('bot/group.json')
  local group_link_lock = group[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'no' then
    pm = '*Link posting is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_link'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Link posting has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unlock_group_english(msg, target)
local group = load_data('bot/group.json')
  local group_english_lock = group[tostring(target)]['settings']['lock_english']
  if group_english_lock == 'no' then
    pm = '*English is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_english'] = 'no'
    save_data(_config.group.data, group)
    pm= '*English has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unlock_group_persian(msg, target)
local group = load_data('bot/group.json')
  local group_persian_lock = group[tostring(target)]['settings']['lock_persian']
  if group_persian_lock == 'no' then
    pm = '*Arabic is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_persian'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Arabic has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unlock_group_flood(msg, target)
local group = load_data('bot/group.json')
  local group_flood_lock = group[tostring(target)]['settings']['lock_flood']
  if group_flood_lock == 'no' then
    pm = '*Flood is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_flood'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Flood has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unlock_group_fosh(msg, target)
local group = load_data('bot/group.json')
  local group_fosh_lock = group[tostring(target)]['settings']['lock_fosh']
  if group_fosh_lock == 'no' then
    pm = '*Fosh is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_fosh'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Fosh has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unlock_group_inline(msg, target)
local group = load_data('bot/group.json')
  local group_inline_lock = group[tostring(target)]['settings']['lock_inline']
  if group_inline_lock == 'no' then
    pm = '*Inline is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_inline'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Inline has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unlock_group_sticker(msg, target)
local group = load_data('bot/group.json')
  local group_sticker_lock = group[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'no' then
    pm = '*Send Sticker is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_sticker'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Send Sticker has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end

local function unlock_group_contact(msg, target)
local group = load_data('bot/group.json')
  local group_contact_lock = group[tostring(target)]['settings']['lock_contact']
  if group_contact_lock == 'no' then
    pm = '*Send Contact is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_contact'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Send Contact has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unlock_group_location(msg, target)
local group = load_data('bot/group.json')
  local group_location_lock = group[tostring(target)]['settings']['lock_location']
  if group_location_lock == 'no' then
    pm = '*Send Location is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_location'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Send Location has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unlock_group_game(msg, target)
local group = load_data('bot/group.json')
  local group_game_lock = group[tostring(target)]['settings']['lock_game']
  if group_game_lock == 'no' then
    pm = '*Send Game is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_game'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Send Game has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end

local function unlock_group_bot(msg, target)
local group = load_data('bot/group.json')
  local group_bot_lock = group[tostring(target)]['settings']['lock_bot']
  if group_bot_lock == 'no' then
    pm = '*Bot api is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_bot'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Bot api has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unlock_group_username(msg, target)
local group = load_data('bot/group.json')
  local group_username_lock = group[tostring(target)]['settings']['lock_username']
  if group_username_lock == 'no' then
    pm = '*Send Username is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_username'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Send Username has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unlock_group_tag(msg, target)
local group = load_data('bot/group.json')
  local group_tag_lock = group[tostring(target)]['settings']['lock_tag']
  if group_tag_lock == 'no' then
    pm = '*Send Tag is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_tag'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Send Tag has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unlock_group_edit(msg, target)
local group = load_data('bot/group.json')
  local group_edit_lock = group[tostring(target)]['settings']['lock_edit']
  if group_edit_lock == 'no' then
    pm = '*Edit post is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_edit'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Edit post has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unlock_group_fwd(msg, target)
local group = load_data('bot/group.json')
  local group_fwd_lock = group[tostring(target)]['settings']['lock_fwd']
  if group_fwd_lock == 'no' then
    pm = '*Forward is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_fwd'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Forward has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function lock_group_spam(msg, target)
local group = load_data('bot/group.json')
  local group_spam_lock = group[tostring(target)]['settings']['lock_spam']
  if group_spam_lock == 'yes' then
    pm = '*Group spam is already locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_spam'] = 'yes'
    save_data(_config.group.data, group)
    pm= '*Group spam has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unlock_group_spam(msg, target)
local group = load_data('bot/group.json')
  local group_spamlock = group[tostring(target)]['settings']['lock_spam']
  if group_spam_lock == 'no' then
    pm = '*Group spam is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_spam'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Group spam has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function mute_all_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_all']
  if mute_all  == 'yes' then
    pm = '*mute all is already locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['mute_all'] = 'yes'
    save_data(_config.group.data, group)
    pm= '*mute all has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unmute_all_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_all']
  if mute_all  == 'no' then
    pm = '*mute all is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['mute_all'] = 'no'
    save_data(_config.group.data, group)
    pm= '*mute all has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function mute_photo_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_photo']
  if mute_all  == 'yes' then
    pm = '*Lock photo is already locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['mute_photo'] = 'yes'
    save_data(_config.group.data, group)
    pm= '*Lock photo has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unmute_photo_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_photo']
  if mute_all  == 'no' then
    pm = '*Lock photo is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['mute_photo'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Lock photo has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function mute_video_group(msg, target)
local group = load_data('bot/group.json')
  local mute_video = group[tostring(target)]['settings']['mute_video']
  if mute_video  == 'yes' then
    pm = '*Lock Video is already locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['mute_video'] = 'yes'
    save_data(_config.group.data, group)
    pm= '*Lock Video has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unmute_video_group(msg, target)
local group = load_data('bot/group.json')
  local mute_video = group[tostring(target)]['settings']['mute_video']
  if mute_video  == 'no' then
    pm = '*Lock Video is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['mute_video'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Lock Video has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function mute_gif_group(msg, target)
local group = load_data('bot/group.json')
  local mute_gif = group[tostring(target)]['settings']['mute_gif']
  if mute_gif  == 'yes' then
    pm = '*Lock Gifs is already locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['mute_gif'] = 'yes'
    save_data(_config.group.data, group)
    pm= '*Lock Gifs has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unmute_gif_group(msg, target)
local group = load_data('bot/group.json')
  local mute_gif = group[tostring(target)]['settings']['mute_gif']
  if mute_gif  == 'no' then
    pm = '*Lock Gifs is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['mute_gif'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Lock Gifs has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function mute_voice_group(msg, target)
local group = load_data('bot/group.json')
  local mute_voice = group[tostring(target)]['settings']['mute_voice']
  if mute_voice  == 'yes' then
    pm = '*Lock Voice is already locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['mute_voice'] = 'yes'
    save_data(_config.group.data, group)
    pm= '*Lock Voice has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unmute_voice_group(msg, target)
local group = load_data('bot/group.json')
  local mute_voice = group[tostring(target)]['settings']['mute_voice']
  if mute_voice  == 'no' then
    pm = '*Lock Voice is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['mute_voice'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Lock Voice has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function mute_audio_group(msg, target)
local group = load_data('bot/group.json')
  local mute_audio = group[tostring(target)]['settings']['mute_audio']
  if mute_audio  == 'yes' then
    pm = '*Lock Audio is already locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['mute_audio'] = 'yes'
    save_data(_config.group.data, group)
    pm= '*Lock Audio has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unmute_audio_group(msg, target)
local group = load_data('bot/group.json')
  local mute_audio = group[tostring(target)]['settings']['mute_audio']
  if mute_audio  == 'no' then
    pm = '*Lock Audio is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['mute_audio'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Lock Audio has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function mute_document_group(msg, target)
local group = load_data('bot/group.json')
  local mute_document = group[tostring(target)]['settings']['mute_document']
  if mute_document  == 'yes' then
    pm = '*Lock Document is already locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['mute_document'] = 'yes'
    save_data(_config.group.data, group)
    pm= '*Lock Document has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end
local function unmute_document_group(msg, target)
local group = load_data('bot/group.json')
  local mute_document = group[tostring(target)]['settings']['mute_document']
  if mute_document  == 'no' then
    pm = '*Lock Document is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['mute_document'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Lock Document has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end

local function lock_group_number(msg, target)
local group = load_data('bot/group.json')
  local group_link_lock = group[tostring(target)]['settings']['lock_number']
  if group_link_lock == 'yes' then
    pm = '*Send number is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_number'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Send number has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end

local function unlock_group_number(msg, target)
local group = load_data('bot/group.json')
  local group_tgservice_lock = group[tostring(target)]['settings']['lock_number']
  if group_tgservice_lock == 'no' then
    pm = '*Send number is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_number'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Send number has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end

local function lock_group_text(msg, target)
local group = load_data('bot/group.json')
  local group_text_lock = group[tostring(target)]['settings']['lock_text']
  if group_text_lock == 'yes' then
    pm = '*Send text is already locked*\n\n`Channel:` @LeaderCh'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
else
    group[tostring(target)]['settings']['lock_text'] = 'yes'
    save_data(_config.group.data, group)
    pm = '*Send text has been locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end

local function unlock_group_text(msg, target)
local group = load_data('bot/group.json')
  local group_text_lock = group[tostring(target)]['settings']['lock_text']
  if group_text_lock == 'no' then
    pm = '*Send text is not locked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  else
    group[tostring(target)]['settings']['lock_text'] = 'no'
    save_data(_config.group.data, group)
    pm= '*Send text has been unlocked*\n\n`Channel:` @LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
  end
end

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

local function group_settings(msg, target)
local group = load_data('bot/group.json')
pm = '<b>SuperGroup settings</b>\n-------------------------------------------'
pm = pm..'\n1- <code>Lock Links</code> : '..group[tostring(target)]['settings']['lock_link']..''
pm = pm..'\n2- <code>Lock Username</code> : '..group[tostring(target)]['settings']['lock_username']..''
pm = pm..'\n3- <code>Lock Tag</code> : '..group[tostring(target)]['settings']['lock_tag']..''
pm = pm..'\n4- <code>Lock Edit</code> : '..group[tostring(target)]['settings']['lock_edit']..''
pm = pm..'\n5- <code>Lock Fwd</code> : '..group[tostring(target)]['settings']['lock_fwd']..''
pm = pm..'\n- <code>Lock Flood</code> : '..group[tostring(target)]['settings']['lock_flood']..''
pm = pm..'\n6- <code>Lock Fosh</code> : '..group[tostring(target)]['settings']['lock_fosh']..''
pm = pm..'\n7- <code>Lock Tgservice</code> : '..group[tostring(target)]['settings']['lock_tgservice']..''
pm = pm..'\n8- <code>Lock Sticker</code> : '..group[tostring(target)]['settings']['lock_sticker']..''
pm = pm..'\n9- <code>Lock Contact</code> : '..group[tostring(target)]['settings']['lock_contact']..''
pm = pm..'\n10- <code>Lock Location</code> : '..group[tostring(target)]['settings']['lock_location']..''
pm = pm..'\n11- <code>Lock Game</code> : '..group[tostring(target)]['settings']['lock_game']..''
pm = pm..'\n9- <code>Lock Bot</code> : '..group[tostring(target)]['settings']['lock_bot']..''
pm = pm..'\n12- <code>Lock Inline</code> : '..group[tostring(target)]['settings']['lock_inline']..''
pm = pm..'\n13- <code>Lock Spam</code> : '..group[tostring(target)]['settings']['lock_spam']..''
pm = pm..'\n14- <code>Lock English</code> : '..group[tostring(target)]['settings']['lock_english']..''
pm = pm..'\n15- <code>Lock Arabic</code> : '..group[tostring(target)]['settings']['lock_persian']..''
--pm = pm..'\n     🔧<b>Mute</b>🔧'
pm = pm..'\n16- <code>Lock Gifs</code> : '..group[tostring(target)]['settings']['mute_gif']..''
pm = pm..'\n17- <code>Lock Photo</code> : '..group[tostring(target)]['settings']['mute_photo']..''
pm = pm..'\n18- <code>Lock Video</code> : '..group[tostring(target)]['settings']['mute_video']..''
pm = pm..'\n19- <code>Lock Voice</code> : '..group[tostring(target)]['settings']['mute_voice']..''
pm = pm..'\n20- <code>Lock Document</code> : '..group[tostring(target)]['settings']['mute_document']..''
pm = pm..'\n21- <code>Lock Number</code> : '..group[tostring(target)]['settings']['lock_number']..''
pm = pm..'\n22- <code>Lock Text</code> : '..group[tostring(target)]['settings']['lock_text']..''	
pm = pm..'\n23- <code>Lock Webpage</code> : '..group[tostring(target)]['settings']['lock_webpage']..''
pm = pm..'\n24- <code>Lock Markdown</code> : '..group[tostring(target)]['settings']['lock_markdown']..''
pm = pm..'\n25- <code>Lock Audio</code> : '..group[tostring(target)]['settings']['mute_audio']..'\n-------------------------------------------'
pm = pm..'\n26- <code>Mute All</code> : '..group[tostring(target)]['settings']['mute_all']..''
pm = pm..'\n- <code>Welcome</code> : '..group[tostring(target)]['settings']['welcome']..''	
--pm = pm..'\n25- <code>Flood Sensitivity</code> : '..NUM_MSG_MAX..''	
pm = pm..'\n-------------------------------------------\n<b>Channel: </b>@LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
end
	
local function run(msg, matches)
	--local is_pv = gp_type(chat) == "pv"
	local group = load_data('bot/group.json')
	local addgroup = group[tostring(msg.chat_id)]
		if matches[1] == 'id' then 
		pm = '*User ID:* [`'..msg.sender_user_id_..'`]\n\n`Channel:` @LeaderCH'			
		tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md') 
	end	
        if addgroup and is_momod(msg) or is_owner(msg) then
	
	if matches[1] == 'setflood' then
		if tonumber(matches[2]) < 3 or tonumber(matches[2]) > 20 then
			tg.sendMessage(msg.chat_id_, msg.id_, 1, '*More than* `3` *and less than* `20`\n\n`Channel:` @LeaderCh', 1, 'md')
		end
		local flood_max = matches[2]
		group[tostring(msg.chat_id)]['settings']['num_msg_max'] = flood_max
		save_data(_config.group.data, group)
		textpm = '*SuperGroup flood sensitivity has been set:* `'..matches[2]..'`'
		tg.sendMessage(msg.chat_id_, msg.id_, 1, textpm, 1, 'md')
        end		
		
	if matches[1] == 'mute' and matches[2] == 'all' then
		mute_all_group(msg, msg.chat_id)
	end		
	if matches[1] == 'unmute' and matches[2] == 'all' then
		unmute_all_group(msg, msg.chat_id,group )
	end		
   	if matches[1] == 'settings' then
		group_settings(msg, msg.chat_id)
	elseif matches[1] == 'lock' then
		if matches[2] == 'links' then
			lock_group_links(msg, msg.chat_id)
		elseif matches[2] == 'edit' then
			lock_group_edit(msg, msg.chat_id)
		elseif matches[2] == 'fwd' then
			lock_group_fwd(msg, msg.chat_id)
		elseif matches[2] == 'tgservice' then
			lock_group_tgservice(msg, msg.chat_id)
		elseif matches[2] == 'username' then
			lock_group_username(msg, msg.chat_id)
		elseif matches[2] == 'tag' then
			lock_group_tag(msg, msg.chat_id)
		elseif matches[2] == 'spam' then
			lock_group_spam(msg, msg.chat_id)
		elseif matches[2] == 'english' then
			lock_group_english(msg, msg.chat_id)
		elseif matches[2] == 'arabic' then
			lock_group_persian(msg, msg.chat_id)
		elseif matches[2] == 'bot' then
			lock_group_bot(msg, msg.chat_id)
		elseif matches[2] == 'flood' then
			lock_group_flood(msg, msg.chat_id)		
                    elseif matches[2] == 'fosh' then
			lock_group_fosh(msg, msg.chat_id)
		elseif matches[2] == 'inline' then
			lock_group_inline(msg, msg.chat_id)
		elseif matches[2] == 'sticker' then
			lock_group_sticker(msg, msg.chat_id)
		elseif matches[2] == 'webpage' then
			lock_group_webpage(msg, msg.chat_id)
		elseif matches[2] == 'markdown' then
			lock_group_markdown(msg, msg.chat_id)
				
		elseif matches[2] == 'contact' then
			lock_group_contact(msg, msg.chat_id)
		elseif matches[2] == 'text' then
			lock_group_text(msg, msg.chat_id)
		elseif matches[2] == 'number' then
			lock_group_number(msg, msg.chat_id)		
		elseif matches[2] == 'location' then
			lock_group_location(msg, msg.chat_id)
		elseif matches[2] == 'game' then
			lock_group_game(msg, msg.chat_id)
					
		--[[elseif matches[2] == 'all' then
			mute_all_group(msg, msg.chat_id)]]		
                elseif matches[2] == 'photo' then
			mute_photo_group(msg, msg.chat_id)
		elseif matches[2] == 'document' then
			mute_document_group(msg, msg.chat_id)
		elseif matches[2] == 'gifs' then
			mute_gif_group(msg, msg.chat_id)
		elseif matches[2] == 'audio' then
			mute_audio_group(msg, msg.chat_id)
		elseif matches[2] == 'voice' then
			mute_voice_group(msg, msg.chat_id)
		elseif matches[2] == 'video' then
			mute_video_group(msg, msg.chat_id)
		end

	elseif matches[1] == 'unlock' then
		if matches[2] == 'links' then
			unlock_group_links(msg, msg.chat_id,group )
		elseif matches[2] == 'edit' then
			unlock_group_edit(msg, msg.chat_id)
		elseif matches[2] == 'fwd' then
			unlock_group_fwd(msg, msg.chat_id)
		elseif matches[2] == 'tgservice' then
			unlock_group_tgservice(msg, msg.chat_id)
		elseif matches[2] == 'username' then
			unlock_group_username(msg, msg.chat_id)
		elseif matches[2] == 'tag' then
			unlock_group_tag(msg, msg.chat_id)
		elseif matches[2] == 'spam' then
			unlock_group_spam(msg, msg.chat_id)
		elseif matches[2] == 'english' then
			unlock_group_english(msg, msg.chat_id)
		elseif matches[2] == 'arabic' then
			unlock_group_persian(msg, msg.chat_id)
		elseif matches[2] == 'bot' then
			unlock_group_bot(msg, msg.chat_id)
		elseif matches[2] == 'flood' then
			unlock_group_flood(msg, msg.chat_id)		
                elseif matches[2] == 'fosh' then
			unlock_group_fosh(msg, msg.chat_id)
		elseif matches[2] == 'inline' then
			unlock_group_inline(msg, msg.chat_id)
		elseif matches[2] == 'sticker' then
			unlock_group_sticker(msg, msg.chat_id)
		elseif matches[2] == 'webpage' then
			unlock_group_webpage(msg, msg.chat_id)
		elseif matches[2] == 'markdown' then
			unlock_group_markdown(msg, msg.chat_id)
				
		elseif matches[2] == 'contact' then
			unlock_group_contact(msg, msg.chat_id)
		elseif matches[2] == 'text' then
			unlock_group_text(msg, msg.chat_id)		
		elseif matches[2] == 'number' then
			unlock_group_number(msg, msg.chat_id)		
		elseif matches[2] == 'location' then
			unlock_group_location(msg, msg.chat_id)
		elseif matches[2] == 'game' then
			unlock_group_game(msg, msg.chat_id)					
					
		--[[elseif matches[2] == 'all' then
			unmute_all_group(msg, msg.chat_id,group )]]
		elseif matches[2] == 'photo' then
			unmute_photo_group(msg, msg.chat_id)
		elseif matches[2] == 'document' then
			unmute_document_group(msg, msg.chat_id)
		elseif matches[2] == 'gifs' then
			unmute_gif_group(msg, msg.chat_id)
		elseif matches[2] == 'audio' then
			unmute_audio_group(msg, msg.chat_id)
		elseif matches[2] == 'voice' then
			unmute_voice_group(msg, msg.chat_id)
		elseif matches[2] == 'video' then
			unmute_video_group(msg, msg.chat_id)
		end
	end						
	end
end

return {
  patterns = {
    "^[/#!](lock) (.*)$",
    "^[/#!](unlock) (.*)$",
    "^[/#!](mute) (.*)$",
	"^[/#!](unmute) (.*)$",
	"^[/#!](id)$",
	"^[/#!](settings)$",
	"^[/#!](setflood) (%d+)$",
	
    "^!!!edit:[/#!](lock) (.*)$",
	"^!!!edit:[/#!](unlock) (.*)$",
	"^!!!edit:[/#!](mute) (.*)$",
	"^!!!edit:[/#!](unmute) (.*)$",
	"^!!!edit:[/#!](settings)$",
	--"^!!!edit:[/#!](id)$",
	--"^!!!edit:[/#!](setflood) (%d+)$",
  },
  run = run
}
