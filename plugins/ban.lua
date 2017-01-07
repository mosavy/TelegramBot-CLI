local group = load_data('bot/group.json')
local addgroup = group[tostring(msg.chat_id)]
if addgroup then
if text_msg == "ban" and is_sudo(msg) or is_owner(msg) or is_momod(msg) then
if not msg.reply_to_message_id_  then
else
local function dl_cb_add_banuser(arg, data)
local userid = data.sender_user_id_
    if db:sismember('banuser:'..msg.chat_id_,userid) then
	chat_del_user(msg.chat_id_, userid)
	sendText(msg.chat_id_, data.id_, 0, 1, nil, get_info(userid)..' Is already a in banuser list.', 1, nil)
	else
	  db:sadd('banuser:'..msg.chat_id_,userid)
	  chat_del_user(msg.chat_id_, userid)
	  sendText(msg.chat_id_, data.id_, 0, 1, nil, get_info(userid)..' Is now in banuser list.', 1, nil) 
    end
end
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = msg.reply_to_message_id_}, dl_cb_add_banuser, nil)
end
return 
elseif text_msg == "unban" and is_sudo(msg) or is_owner(msg) or is_momod(msg) then
if not msg.reply_to_message_id_  then
else
local function dl_cb_rem_banuser(arg, data)
local userid = data.sender_user_id_
    if not db:sismember('banuser:'..msg.chat_id_,userid) then
	sendText(msg.chat_id_, data.id_, 0, 1, nil, get_info(userid)..' Is not in banuser list.', 1, nil)
	else
	  db:srem('banuser:'..msg.chat_id_,userid)
	  sendText(msg.chat_id_, data.id_, 0, 1, nil, get_info(userid)..' Removed from banuser list..', 1, nil) 
    end
end
tdcli_function({ID = "GetMessage",chat_id_ = msg.chat_id_,message_id_ = msg.reply_to_message_id_}, dl_cb_rem_banuser, nil)
end
return 
elseif text_msg == "banlist" and is_sudo(msg) or is_owner(msg) or is_momod(msg) then 
local mod = db:smembers('banuser:'..msg.chat_id_)
local text = '*Ban list :*\n'
for k,v in pairs(mod) do
text = text..'`'..k..'`--* '..get_info(v)..'*\n'
end
return sendText(msg.chat_id_, msg.id_, 0, 1, nil, text, 1, nil) 
end
end