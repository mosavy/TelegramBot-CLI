local function settings(msg, target,group)
local group = load_data('bot/group.json')
pm = '<b>SuperGroup settings</b>\n----------------------\n'
pm = pm..'\n1- <code>Lock Links</code> : '..group[tostring(target)]['settings']['lock_link']..''
pm = pm..'\n2- <code>Lock Username</code> : '..(group[tostring(target)]['settings']['lock_username'] or 'no')..''
pm = pm..'\n3- <code>Lock Tag</code> : '..(group[tostring(target)]['settings']['lock_tag'] or 'no')..''
pm = pm..'\n4- <code>Lock Edit</code> : '..group[tostring(target)]['settings']['lock_edit']..''
pm = pm..'\n5- <code>Lock Fwd</code> : '..(group[tostring(target)]['settings']['lock_fwd'] or 'no')..''
--pm = pm..'\n5- <code>Lock Flood</code> : '..(group[tostring(target)]['settings']['lock_flood'] or 'no')..''
pm = pm..'\n6- <code>Lock Fosh</code> : '..(group[tostring(target)]['settings']['lock_fosh'] or 'no')..''
pm = pm..'\n7- <code>Lock Tgservice</code> : '..(group[tostring(target)]['settings']['lock_tgservice'] or 'no')..''
pm = pm..'\n8- <code>Lock Sticker</code> : '..(group[tostring(target)]['settings']['lock_sticker'] or 'no')..''
pm = pm..'\n9- <code>Lock Bot</code> : '..(group[tostring(target)]['settings']['lock_bot'] or 'no')..''
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
local function group_settings(msg, target)
local group = load_data('bot/group.json')
pm = '<b>SuperGroup settings</b>\n----------------------\n'
pm = pm..'\n1- <code>Lock Links</code> : '..group[tostring(target)]['settings']['lock_link']..''
pm = pm..'\n2- <code>Lock Username</code> : '..group[tostring(target)]['settings']['lock_username']..''
pm = pm..'\n3- <code>Lock Tag</code> : '..group[tostring(target)]['settings']['lock_tag']..''
pm = pm..'\n4- <code>Lock Edit</code> : '..group[tostring(target)]['settings']['lock_edit']..''
pm = pm..'\n5- <code>Lock Fwd</code> : '..group[tostring(target)]['settings']['lock_fwd']..''
--pm = pm..'\n5- <code>Lock Flood</code> : '..group[tostring(target)]['settings']['lock_flood']..''
pm = pm..'\n6- <code>Lock Fosh</code> : '..group[tostring(target)]['settings']['lock_fosh']..''
pm = pm..'\n7- <code>Lock Tgservice</code> : '..group[tostring(target)]['settings']['lock_tgservice']..''
pm = pm..'\n8- <code>Lock Sticker</code> : '..group[tostring(target)]['settings']['lock_sticker']..''
pm = pm..'\n9- <code>Lock Bot</code> : '..group[tostring(target)]['settings']['lock_bot']..''
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
local addgroup = group[tostring(msg.chat_id)]
if addgroup and is_momod(msg) then
if matches[1] == 'settings'  then
group_settings(msg, msg.chat_id)
end
end
end
return {
  patterns = {
	"^[/#!](settings)$",
"^!!!edit:[/#!](settings)$",
  },
  run = run
}
