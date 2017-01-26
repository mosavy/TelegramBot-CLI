local function rmmsg (arg,data)
for k,v in pairs(data.messages_) do
tg.deleteMessages(v.chat_id_,{[0] = v.id_})
       
end
end
local function run(msg, matches)
local group = load_data('bot/group.json')
local addgroup = group[tostring(msg.chat_id)]
    if matches[1] == 'rmsg' and is_sudo(msg) or is_owner(msg) and addgroup then
    --if msg.chat_id_:match("^-40") then
       --if is_sudo(msg) or is_momod(msg) or is_owner(msg) and addgroup then
          if tonumber(matches[2]) > 40 or tonumber(matches[2]) < 1 then
             pm = '<b>More than</b> <code>1</code> <b>and less than</b> <code>40</code>'
             tg.sendMessage(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
             else
          tdcli_function ({
    ID = "GetChatHistory",
    chat_id_ = msg.chat_id_,
    from_message_id_ = 0,
    offset_ = 0,
    limit_ = tonumber(matches[2])
  }, rmmsg, nil)
             pm ='<code>'..matches[2]..'</code> <b>Last Messages Has Been Removed</b>'
             tg.sendMessage(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
         end 
     --end
--end
end
end

return {
    patterns = {
        '^[!#/](rmsg) (%d*)$'
    },
    run = run
}
