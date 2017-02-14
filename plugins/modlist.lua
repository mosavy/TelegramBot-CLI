local function modlist(msg)
    local group = load_data('bot/group.json')
    local i = 1
	if next(group[tostring(msg.chat_id_)]['moderators']) == 0 then 
		text1 = '*No moderator in this group*'
		tg.sendMessage(msg.chat_id_, 0, 1, text1, 1, 'md')
	end
	local message = '*List of moderators :* \n'
	for k,v in pairs(group[tostring(msg.chat_id_)]['moderators']) do
		message = message.. '*' ..i.. '-* ' ..v.. ' [' ..k.. '] \n'
		i = i + 1
	end
	tg.sendMessage(msg.chat_id_, 0, 1, message, 1, 'md')
end
local function run(msg, matches)
local group = load_data('bot/group.json')
local addgroup = group[tostring(msg.chat_id_)]
if matches[1] == 'modlist' and is_owner(msg) or is_momod(msg) and addgroup then
return modlist(msg)
end
end
return {
  patterns = {
"^[#!/](modlist)$",
  },
  run = run
}
