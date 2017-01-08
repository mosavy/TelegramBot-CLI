local function run(msg, matches)
local group = load_data('bot/group.json')	
local addgroup = group[tostring(msg.chat_id)]	
if matches[1] == 'echo' and matches[2] and is_sudo(msg) then		
pm = matches[2]
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
end	
if matches[1] == 'git pull' and is_sudo(msg) then
  io.popen("git pull")
  tg.sendMessage(msg.chat_id_, 0, 1, '✅✅✅git pull✅✅✅', 1, 'md')
end	


if matches[1] == 'ids' and addgroup and is_owner(msg) or is_momod(msg) then
if msg.reply_to_message_id_ ~= 0 then
tg.getMessage(msg.chat_id_,msg.reply_to_message_id_)
tg.sendMessage(msg.chat_id_, 0, 1,'<b>ID: </b>[ '..msg.from_id..' ]', 1, 'html')
end
end
end
	
return {
  patterns = {
		"^[/#!](git pull)$",
		"^[/#!](echo) (.*)$",
		
		"^[/#!](ids)$",
  },
  run = run
}
