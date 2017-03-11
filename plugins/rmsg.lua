local function cleanmsg (arg,data)
     for k,v in pairs(data.messages_) do
         tg.deleteMessages(v.chat_id_,{[0] = v.id_})
     end
end
local function run(msg, matches)
    if matches[1] == 'rmsg' and is_owner(msg) or is_momod(msg) then
         if msg.chat_id_:match("^-100") then
        --    if is_owner(msg) then
              if tonumber(matches[2]) > 40 or tonumber(matches[2]) < 1 then
                  pm = '*More than* `1` *and less than* `40`'
                  tg.sendMessage(msg.chat_id_, data.msg.id_, 1, pm, 1, 'md')
              else
                  tdcli_function ({
                 ID = "GetChatHistory",
                 chat_id_ = msg.chat_id_,
                 from_message_id_ = 0,
                 offset_ = 0,
                 limit_ = tonumber(matches[2])
                 }, cleanmsg, nil)
                 tg.sendMessage(msg.chat_id_, msg.id_, 1, '`'..matches[2]..'` *Message Has Been Removed*', 1, 'md')
             end
           --end
        end
     end
end
return {
    patterns = {
        '^[!#/]([Rr]msg) (%d*)$',
    },
    run = run
}
