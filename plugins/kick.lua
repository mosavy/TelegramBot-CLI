local function run(msg, matches)
	if matches[1] == 'kick' and is_owner(msg) or is_momod(msg) then
	if msg.reply_to_message_id_ ~= 0 then
		tg.getMessage(msg.chat_id_,msg.reply_to_message_id_)
		tg.changeChatMemberStatus(chat_id, data.id_, 'Kicked')
	elseif msg.text:match("@(.*)") then
	     tg.sendMessage(msg.chat_id, 0, 0,  'user [ @'..msg.text:match("@(.*)")..' ] kicked', 0)
		tg.changeChatMemberStatus(chat_id, data.id_, 'Kicked')	
	elseif tonumber(matches[2]) then
         tg.sendMessage(msg.chat_id, 0, 0,  '[ '..matches[2]..' ] kicked', 0)
		tg.changeChatMemberStatus(chat_id, data.id_, 'Kicked')	
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
