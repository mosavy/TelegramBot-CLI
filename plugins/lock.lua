local function settings(msg, target,group)
local group = load_data('bot/group.json')
pm = '<b>SuperGroup settings</b>\n-------------------------------------------'
pm = pm..'\n1- <code>Lock Links</code> : '..group[tostring(target)]['settings']['lock_link']..''
pm = pm..'\n2- <code>Lock Username</code> : '..(group[tostring(target)]['settings']['lock_username'] or 'no')..''
pm = pm..'\n3- <code>Lock Tag</code> : '..(group[tostring(target)]['settings']['lock_tag'] or 'no')..''
pm = pm..'\n4- <code>Lock Edit</code> : '..group[tostring(target)]['settings']['lock_edit']..''
pm = pm..'\n5- <code>Lock Fwd</code> : '..(group[tostring(target)]['settings']['lock_fwd'] or 'no')..''
--pm = pm..'\n5- <code>Lock Flood</code> : '..(group[tostring(target)]['settings']['lock_flood'] or 'no')..''
pm = pm..'\n6- <code>Lock Fosh</code> : '..(group[tostring(target)]['settings']['lock_fosh'] or 'no')..''
pm = pm..'\n7- <code>Lock Tgservice</code> : '..(group[tostring(target)]['settings']['lock_tgservice'] or 'no')..''
pm = pm..'\n8- <code>Lock Sticker</code> : '..(group[tostring(target)]['settings']['lock_sticker'] or 'no')..''
--pm = pm..'\n9- <code>Lock Bot</code> : '..(group[tostring(target)]['settings']['lock_bot'] or 'no')..''
pm = pm..'\n10- <code>Lock Inline</code> : '..(group[tostring(target)]['settings']['lock_inline'] or 'no')..''
pm = pm..'\n11- <code>Lock Spam</code> : '..(group[tostring(target)]['settings']['lock_spam'] or 'no')..''
pm = pm..'\n12- <code>Lock English</code> : '..(group[tostring(target)]['settings']['lock_english'] or 'no')..''
pm = pm..'\n13- <code>Lock Arabic</code> : '..(group[tostring(target)]['settings']['lock_persian'] or 'no')..''
--pm = pm..'\n     🔧<b>Mute</b>🔧'
pm = pm..'\n14- <code>Lock All</code> : '..(group[tostring(target)]['settings']['mute_all'] or 'no')..''
pm = pm..'\n15- <code>Lock Photo</code> : '..(group[tostring(target)]['settings']['mute_photo'] or 'no')..''
pm = pm..'\n16- <code>Lock Video</code> : '..(group[tostring(target)]['settings']['mute_video'] or 'no')..''
pm = pm..'\n17- <code>Lock Voice</code> : '..(group[tostring(target)]['settings']['mute_voice'] or 'no')..''
pm = pm..'\n18- <code>Lock Document</code> : '..(group[tostring(target)]['settings']['mute_document'] or 'no')..''
pm = pm..'\n19- <code>Lock Audio</code> : '..(group[tostring(target)]['settings']['mute_audio'] or 'no')..''
pm = pm..'\n20- <code>Lock Gifs</code> : '..(group[tostring(target)]['settings']['mute_gif'] or 'no')..''
pm = pm..'\n----------------------\n\n<b>Channel: </b>@LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
end
local function lock_group_links(msg, target)
local group = load_data('bot/group.json')
  local group_link_lock = group[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'yes' then
    pm = 'Link posting is already locked'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_link'] = 'yes'
    save_data(_config.group.data, group)
    pm = 'Link posting has been locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_username(msg, target)
local group = load_data('bot/group.json')
  local group_username_lock = group[tostring(target)]['settings']['lock_username']
  if group_username_lock == 'yes' then
    pm = 'Send Username is already locked'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_username'] = 'yes'
    save_data(_config.group.data, group)
    pm = 'Send Username has been locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_tag(msg, target)
local group = load_data('bot/group.json')
  local group_tag_lock = group[tostring(target)]['settings']['lock_tag']
  if group_tag_lock == 'yes' then
    pm = 'Send Tag is already locked'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_tag'] = 'yes'
    save_data(_config.group.data, group)
    pm = 'Send Tag has been locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_english(msg, target)
local group = load_data('bot/group.json')
  local group_english_lock = group[tostring(target)]['settings']['lock_english']
  if group_english_lock == 'yes' then
    pm = 'English is already locked'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_english'] = 'yes'
    save_data(_config.group.data, group)
    pm = 'English has been locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_persian(msg, target)
local group = load_data('bot/group.json')
  local group_persian_lock = group[tostring(target)]['settings']['lock_persian']
  if group_persian_lock == 'yes' then
    pm = 'Arabic is already locked'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_persian'] = 'yes'
    save_data(_config.group.data, group)
    pm = 'Arabic has been locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_flood(msg, target)
local group = load_data('bot/group.json')
  local group_flood_lock = group[tostring(target)]['settings']['lock_flood']
  if group_flood_lock == 'yes' then
    pm = 'Flood is already locked'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_flood'] = 'yes'
    save_data(_config.group.data, group)
    pm = 'Flood has been locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_fosh(msg, target)
local group = load_data('bot/group.json')
  local group_fosh_lock = group[tostring(target)]['settings']['lock_fosh']
  if group_fosh_lock == 'yes' then
    pm = 'Fosh is already locked'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_fosh'] = 'yes'
    save_data(_config.group.data, group)
    pm = 'Fosh has been locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_inline(msg, target)
local group = load_data('bot/group.json')
  local group_inline_lock = group[tostring(target)]['settings']['lock_inline']
  if group_inline_lock == 'yes' then
    pm = 'Inline is already locked'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_inline'] = 'yes'
    save_data(_config.group.data, group)
    pm = 'Inline has been locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_sticker(msg, target)
local group = load_data('bot/group.json')
  local group_sticker_lock = group[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'yes' then
    pm = 'Send Sticker is already locked'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_sticker'] = 'yes'
    save_data(_config.group.data, group)
    pm = 'Send Sticker has been locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_bot(msg, target)
local group = load_data('bot/group.json')
  local group_bot_lock = group[tostring(target)]['settings']['lock_bot']
  if group_bot_lock == 'yes' then
    pm = 'Bot api is already locked'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_bot'] = 'yes'
    save_data(_config.group.data, group)
    pm = 'Bot api has been locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_edit(msg, target)
local group = load_data('bot/group.json')
  local group_edit_lock = group[tostring(target)]['settings']['lock_edit']
  if group_edit_lock == 'yes' then
    pm = 'Edit post is already locked'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_edit'] = 'yes'
    save_data(_config.group.data, group)
    pm = 'Edit post has been locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_fwd(msg, target)
local group = load_data('bot/group.json')
  local group_fwd_lock = group[tostring(target)]['settings']['lock_fwd']
  if group_fwd_lock == 'yes' then
    pm = 'Forwaed is already locked'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_fwd'] = 'yes'
    save_data(_config.group.data, group)
    pm = 'Forwaed has been locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_tgservice(msg, target)
local group = load_data('bot/group.json')
  local group_tgservice_lock = group[tostring(target)]['settings']['lock_tgservice']
  if group_tgservice_lock == 'yes' then
    pm = 'tgservice is already locked'
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
else
    group[tostring(target)]['settings']['lock_tgservice'] = 'yes'
    save_data(_config.group.data, group)
    pm = 'tgservice has been locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end

local function unlock_group_tgservice(msg, data, target)
local group = load_data('bot/group.json')
  local group_tgservice_lock = group[tostring(target)]['settings']['lock_tgservice']
  if group_tgservice_lock == 'no' then
    pm = 'tgservice is not locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_tgservice'] = 'no'
    save_data(_config.group.data, group)
    pm= 'tgservice has been unlocked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_links(msg, target)
local group = load_data('bot/group.json')
  local group_link_lock = group[tostring(target)]['settings']['lock_link']
  if group_link_lock == 'no' then
    pm = 'Link posting is not locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_link'] = 'no'
    save_data(_config.group.data, group)
    pm= 'Link posting has been unlocked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_english(msg, target)
local group = load_data('bot/group.json')
  local group_english_lock = group[tostring(target)]['settings']['lock_english']
  if group_english_lock == 'no' then
    pm = 'English is not locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_english'] = 'no'
    save_data(_config.group.data, group)
    pm= 'English has been unlocked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_persian(msg, target)
local group = load_data('bot/group.json')
  local group_persian_lock = group[tostring(target)]['settings']['lock_persian']
  if group_persian_lock == 'no' then
    pm = 'Arabic is not locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_persian'] = 'no'
    save_data(_config.group.data, group)
    pm= 'Arabic has been unlocked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_flood(msg, target)
local group = load_data('bot/group.json')
  local group_flood_lock = group[tostring(target)]['settings']['lock_flood']
  if group_flood_lock == 'no' then
    pm = 'Flood is not locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_flood'] = 'no'
    save_data(_config.group.data, group)
    pm= 'Flood has been unlocked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_fosh(msg, target)
local group = load_data('bot/group.json')
  local group_fosh_lock = group[tostring(target)]['settings']['lock_fosh']
  if group_fosh_lock == 'no' then
    pm = 'Fosh is not locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_fosh'] = 'no'
    save_data(_config.group.data, group)
    pm= 'Fosh has been unlocked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_inline(msg, target)
local group = load_data('bot/group.json')
  local group_inline_lock = group[tostring(target)]['settings']['lock_inline']
  if group_inline_lock == 'no' then
    pm = 'Inline is not locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_inline'] = 'no'
    save_data(_config.group.data, group)
    pm= 'Inline has been unlocked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_sticker(msg, target)
local group = load_data('bot/group.json')
  local group_sticker_lock = group[tostring(target)]['settings']['lock_sticker']
  if group_sticker_lock == 'no' then
    pm = 'Send Sticker is not locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_sticker'] = 'no'
    save_data(_config.group.data, group)
    pm= 'Send Sticker has been unlocked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_bot(msg, target)
local group = load_data('bot/group.json')
  local group_bot_lock = group[tostring(target)]['settings']['lock_bot']
  if group_bot_lock == 'no' then
    pm = 'Bot api is not locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_bot'] = 'no'
    save_data(_config.group.data, group)
    pm= 'Bot api has been unlocked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_username(msg, target)
local group = load_data('bot/group.json')
  local group_username_lock = group[tostring(target)]['settings']['lock_username']
  if group_username_lock == 'no' then
    pm = 'Send Username is not locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_username'] = 'no'
    save_data(_config.group.data, group)
    pm= 'Send Username has been unlocked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_tag(msg, target)
local group = load_data('bot/group.json')
  local group_tag_lock = group[tostring(target)]['settings']['lock_tag']
  if group_tag_lock == 'no' then
    pm = 'Send Tag is not locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_tag'] = 'no'
    save_data(_config.group.data, group)
    pm= 'Send Tag has been unlocked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_edit(msg, target)
local group = load_data('bot/group.json')
  local group_edit_lock = group[tostring(target)]['settings']['lock_edit']
  if group_edit_lock == 'no' then
    pm = 'Edit post is not locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_edit'] = 'no'
    save_data(_config.group.data, group)
    pm= 'Edit post has been unlocked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_fwd(msg, target)
local group = load_data('bot/group.json')
  local group_fwd_lock = group[tostring(target)]['settings']['lock_fwd']
  if group_fwd_lock == 'no' then
    pm = 'Forward is not locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_fwd'] = 'no'
    save_data(_config.group.data, group)
    pm= 'Forward has been unlocked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function lock_group_spam(msg, target)
local group = load_data('bot/group.json')
  local group_spam_lock = group[tostring(target)]['settings']['lock_spam']
  if group_spam_lock == 'yes' then
    pm = 'Group spam is already locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_spam'] = 'yes'
    save_data(_config.group.data, group)
    pm= 'Group spam has been locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unlock_group_spam(msg, target)
local group = load_data('bot/group.json')
  local group_spamlock = group[tostring(target)]['settings']['lock_spam']
  if group_spam_lock == 'no' then
    pm = 'Group spam is not locked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['lock_spam'] = 'no'
    save_data(_config.group.data, group)
    pm= 'Group spam has been unlocked'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_all_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_all']
  if mute_all  == 'yes' then
    pm = '<b>Lock all is already locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_all'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Lock all has been locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_all_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_all']
  if mute_all  == 'no' then
    pm = '<b>Lock all is not locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_all'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Lock all has been unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_photo_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_photo']
  if mute_all  == 'yes' then
    pm = '<b>Lock photo is already locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_photo'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Lock photo has been locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_photo_group(msg, target)
local group = load_data('bot/group.json')
  local mute_all = group[tostring(target)]['settings']['mute_photo']
  if mute_all  == 'no' then
    pm = '<b>Lock photo is not locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_photo'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Lock photo has been unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_video_group(msg, target)
local group = load_data('bot/group.json')
  local mute_video = group[tostring(target)]['settings']['mute_video']
  if mute_video  == 'yes' then
    pm = '<b>Lock Video is already locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_video'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Lock Video has been locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_video_group(msg, target)
local group = load_data('bot/group.json')
  local mute_video = group[tostring(target)]['settings']['mute_video']
  if mute_video  == 'no' then
    pm = '<b>Lock Video is not locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_video'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Lock Video has been unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_gif_group(msg, target)
local group = load_data('bot/group.json')
  local mute_gif = group[tostring(target)]['settings']['mute_gif']
  if mute_gif  == 'yes' then
    pm = '<b>Lock Gifs is already locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_gif'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Lock Gifs has been locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_gif_group(msg, target)
local group = load_data('bot/group.json')
  local mute_gif = group[tostring(target)]['settings']['mute_gif']
  if mute_gif  == 'no' then
    pm = '<b>Lock Gifs is not locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_gif'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Lock Gifs has been unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_voice_group(msg, target)
local group = load_data('bot/group.json')
  local mute_voice = group[tostring(target)]['settings']['mute_voice']
  if mute_voice  == 'yes' then
    pm = '<b>Lock Voice is already locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_voice'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Lock Voice has been locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_voice_group(msg, target)
local group = load_data('bot/group.json')
  local mute_voice = group[tostring(target)]['settings']['mute_voice']
  if mute_voice  == 'no' then
    pm = '<b>Lock Voice is not locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_voice'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Lock Voice has been unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_audio_group(msg, target)
local group = load_data('bot/group.json')
  local mute_audio = group[tostring(target)]['settings']['mute_audio']
  if mute_audio  == 'yes' then
    pm = '<b>Lock Audio is already locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_audio'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Lock Audio has been locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_audio_group(msg, target)
local group = load_data('bot/group.json')
  local mute_audio = group[tostring(target)]['settings']['mute_audio']
  if mute_audio  == 'no' then
    pm = '<b>Lock Audio is not locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_audio'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Lock Audio has been unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function mute_document_group(msg, target)
local group = load_data('bot/group.json')
  local mute_document = group[tostring(target)]['settings']['mute_document']
  if mute_document  == 'yes' then
    pm = '<b>Lock Document is already locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_document'] = 'yes'
    save_data(_config.group.data, group)
    pm= '<b>Lock Document has been locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
local function unmute_document_group(msg, target)
local group = load_data('bot/group.json')
  local mute_document = group[tostring(target)]['settings']['mute_document']
  if mute_document  == 'no' then
    pm = '<b>Lock Document is not locked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  else
    group[tostring(target)]['settings']['mute_document'] = 'no'
    save_data(_config.group.data, group)
    pm= '<b>Lock Document has been unlocked</b>'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
  end
end
--[[local floodMax = 5
local floodTime = 2
local group = load_data('bot/group.json')
local hashflood =  group[tostring(target)]['settings']['lock_flood']
if hashflood == 'yes' and not is_momod(msg) or not is_owner(msg) then
local hash = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msg-num'
local msgs = tonumber(redis:get(hash) or 0)
if msgs > (floodMax - 1) then
        tg.changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
        tg.sendMessage(msg.chat_id_, 1, 'User _'..msg.sender_user_id_..' has been kicked for #flooding !', 1, 'md')
redis:setex(hash, floodTime, msgs+1)
end
end]]
local function group_settings(msg, target)
local group = load_data('bot/group.json')
pm = '<b>SuperGroup settings</b>\n-------------------------------------------'
pm = pm..'\n1- <code>Lock Links</code> : '..group[tostring(target)]['settings']['lock_link']..''
pm = pm..'\n2- <code>Lock Username</code> : '..group[tostring(target)]['settings']['lock_username']..''
pm = pm..'\n3- <code>Lock Tag</code> : '..group[tostring(target)]['settings']['lock_tag']..''
pm = pm..'\n4- <code>Lock Edit</code> : '..group[tostring(target)]['settings']['lock_edit']..''
pm = pm..'\n5- <code>Lock Fwd</code> : '..group[tostring(target)]['settings']['lock_fwd']..''
--pm = pm..'\n5- <code>Lock Flood</code> : '..group[tostring(target)]['settings']['lock_flood']..''
pm = pm..'\n6- <code>Lock Fosh</code> : '..group[tostring(target)]['settings']['lock_fosh']..''
pm = pm..'\n7- <code>Lock Tgservice</code> : '..group[tostring(target)]['settings']['lock_tgservice']..''
pm = pm..'\n8- <code>Lock Sticker</code> : '..group[tostring(target)]['settings']['lock_sticker']..''
--pm = pm..'\n9- <code>Lock Bot</code> : '..group[tostring(target)]['settings']['lock_bot']..''
pm = pm..'\n10- <code>Lock Inline</code> : '..group[tostring(target)]['settings']['lock_inline']..''
pm = pm..'\n11- <code>Lock Spam</code> : '..group[tostring(target)]['settings']['lock_spam']..''
pm = pm..'\n12- <code>Lock English</code> : '..group[tostring(target)]['settings']['lock_english']..''
pm = pm..'\n13- <code>Lock Arabic</code> : '..group[tostring(target)]['settings']['lock_persian']..''
--pm = pm..'\n     🔧<b>Mute</b>🔧'
pm = pm..'\n14- <code>Lock All</code> : '..group[tostring(target)]['settings']['mute_all']..''
pm = pm..'\n15- <code>Lock Photo</code> : '..group[tostring(target)]['settings']['mute_photo']..''
pm = pm..'\n16- <code>Lock Video</code> : '..group[tostring(target)]['settings']['mute_video']..''
pm = pm..'\n17- <code>Lock Voice</code> : '..group[tostring(target)]['settings']['mute_voice']..''
pm = pm..'\n18- <code>Lock Document</code> : '..group[tostring(target)]['settings']['mute_document']..''
pm = pm..'\n19- <code>Lock Audio</code> : '..group[tostring(target)]['settings']['mute_audio']..''
pm = pm..'\n20- <code>Lock Gifs</code> : '..group[tostring(target)]['settings']['mute_gif']..''
pm = pm..'\n----------------------\n<b>Channel: </b>@LeaderCh'
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
end
local function run(msg, matches)
if matches[1] == 'echo' and is_sudo(msg) then		
pm = matches[2]
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
end	
if matches[1] == 'git pull' and is_sudo(msg) then
  io.popen("git pull")
  tg.sendMessage(msg.chat_id_, msg.id_, 1, '✅ عمليات [Git Pull] به اتمام رسيد . . .‌\n🔸پيشنهاد ميشود ربات در مجددا launch كنيد . . . ', 1, 'md')
end	
local addgroup = group[tostring(msg.chat_id)]
if addgroup and is_momod(msg) or is_sudo(msg) or is_owner(msg) then
if matches[1] == 'id' then 
pm = '*SuperGroup ID :* `'..msg.chat_id_..'`\n*User ID :* `'..msg.sender_user_id_..'`\n*Channel :* @LeaderCH'			
--local chat_id = msg.chat_id_
--local user_id = msg.sender_user_id_
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html') 
end		
if is_momod(msg) or is_owner(msg) then		
if matches[1] == 'settings'  then
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
--elseif matches[2] == 'bot' then
--[[lock_group_bot(msg, msg.chat_id)
elseif matches[2] == 'flood' then
lock_group_flood(msg, msg.chat_id)]]
elseif matches[2] == 'fosh' then
lock_group_fosh(msg, msg.chat_id)
elseif matches[2] == 'inline' then
lock_group_inline(msg, msg.chat_id)
elseif matches[2] == 'sticker' then
lock_group_sticker(msg, msg.chat_id)
elseif matches[2] == 'all' then
mute_all_group(msg, msg.chat_id)
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
--elseif matches[2] == 'bot' then
--[[unlock_group_bot(msg, msg.chat_id)
elseif matches[2] == 'flood' then
unlock_group_flood(msg, msg.chat_id)]]
elseif matches[2] == 'fosh' then
unlock_group_fosh(msg, msg.chat_id)
elseif matches[2] == 'inline' then
unlock_group_inline(msg, msg.chat_id)
elseif matches[2] == 'sticker' then
unlock_group_sticker(msg, msg.chat_id)
elseif matches[2] == 'all' then
unmute_all_group(msg, msg.chat_id,group )
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
end
return {
  patterns = {
    "^[/#!](lock) (.*)$",
    "^[/#!](unlock) (.*)$",
    "^[/#!](mute) (.*)$",
	"^[/#!](unmute) (.*)$",
	"^[/#!](settings)$",
		"^[/#!](git pull)$",
		"^[/#!](id)$",
"^!!!edit:[/#!](lock) (.*)$",
"^!!!edit:[/#!](unlock) (.*)$",
"^!!!edit:[/#!](mute) (.*)$",
"^!!!edit:[/#!](unmute) (.*)$",
"^!!!edit:[/#!](settings)$",
  },
  run = run
}
