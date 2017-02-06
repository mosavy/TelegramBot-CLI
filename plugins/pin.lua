
local function run(msg, matches)
	if matches[1] == 'pin' and is_owner(msg) or is_momod(msg) then
	    tg.pinChannelMessage(msg.chat_id_, msg.reply_to_message_id_, 1)
		tg.sendMessage(msg.chat_id_, 0, 0,  '*Pinned Message*', 'md')
	elseif matches[1] == 'unpin' and is_owner(msg) or is_momod(msg) then
	    tg.unpinChannelMessage(msg.chat_id_)
		tg.sendMessage(msg.chat_id_, 0, 0,  '*deleted pin message*', 'md')
	end
end
return {
  patterns = {
    "^[#!/](pin)$",
	"^[#!/](unpin)$"
  },
  run = run
}
