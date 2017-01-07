local function run(msg, matches)
	if matches[1] == 'kick' and is_owner(msg) or is_momod(msg) then
	if msg.reply_to_message_id_ then
		tg.getMessage(msg.chat_id_,msg.reply_to_message_id_)
		tg.changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, 'Kicked')
	elseif msg.text:match("@(.*)") then
	     tg.sendMessage(msg.chat_id, 0, 0,  'user [ @'..msg.text:match("@(.*)")..' ] kicked', 0)
		tg.changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, 'Kicked')	
	elseif tonumber(matches[2]) then
         tg.sendMessage(msg.chat_id, 0, 0,  '[ '..matches[2]..' ] kicked', 0)
		tg.changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, 'Kicked')	
	end
	end
	if matches[1] == 'ban' and is_owner(msg) or is_momod(msg) then
	if msg.reply_to_message_id_ then
		tg.getMessage(msg.chat_id_,msg.reply_to_message_id_)
		tg.changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, 'Banned')
	elseif msg.text:match("@(.*)") then
	     tg.sendMessage(msg.chat_id, 0, 0,  'user [ @'..msg.text:match("@(.*)")..' ] Banned', 0)
		tg.changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, 'Banned')	
	elseif tonumber(matches[2]) then
         tg.sendMessage(msg.chat_id, 0, 0,  'user [ '..matches[2]..' ] Banned', 0)
		tg.changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, 'Banned')	
	end
	end	
end
return {
  patterns = {
    "^[#!/](kick)$",
	"^[#!/](kick) (.+)$",
	    "^[#!/](ban)$",
	"^[#!/](ban) (.+)$",	
  },
  run = run
}	
