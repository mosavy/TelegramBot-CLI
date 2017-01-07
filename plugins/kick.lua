local function run(msg, matches)
	if matches[1] == 'kick' and is_owner(msg) or is_momod(msg) then
	if msg.reply_to_message_id_ ~= 0 then
		tg.getMessage(msg.chat_id_,msg.reply_to_message_id_)
		tdcli.changeChatMemberStatus(chat_id, data.id_, 'Kicked')
	elseif msg.text:match("@(.*)") then
	     tg.sendMessage(msg.chat_id, 0, 0,  'user [ '..msg.text:match("@(.*)")..' ] kicked', 0)
	elseif tonumber(matches[2]) then
         tg.sendMessage(msg.chat_id, 0, 0,  '[ '..matches[2]..' ] added as owner', 0)
	end
	end
end
return {
  patterns = {
    "^[#!/](kick)$",
	"^[#!/](kick) (.+)$",
  },
  run = run
}	
if matches[1] == 'modlist' and is_owner(msg) then
  local i = 1
  local message = '\nList of moderators for:\n'
  for k,v in pairs(group[msg.chat_id_]['moderators'][tostring(user_id)) do
    message = message ..i..' - '..v..' [' ..k.. '] \n'
    i = i + 1
  end
   tg.sendMessage(msg.chat_id_, 0, 1,'owner['..message..']', 1, 'html')
end