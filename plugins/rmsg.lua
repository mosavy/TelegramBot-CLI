local function rem (i,m)
    msgs = i.msgs 
    for k,v in pairs(m.messages_) do
        msgs = msgs - 1
        tg.deleteMessages(v.chat_id_,{[0] = v.id_})
        if msgs == 1 then
            tg.deleteMessages(m.messages_[0].chat_id_,{[0] = m.messages_[0].id_})
            return false
        end
    end
    tg.getChatHistory(m.messages_[0].chat_id_, m.messages_[0].id_,0 , 100, rem, {msgs=msgs})
end
local function run(msg, matches)
    local chat = msg.chat_id_
    if matches[1] == 'rmsg' and is_owner(msg) or is_momod(msg) then
        if tostring(msg.chat_id_):match("^-100") then 
            if tonumber(matches[2]) > 40 or tonumber(matches[2]) < 1 then
                pm = '*More than* `1` *and less than* `40`'
                tg.sendMessage(msg.chat_id_, msg.id_, 1, pm, 1, 'md')
            else
				tg.getChatHistory(msg.chat_id_, msg.id_,0 , 100, rem, {msgs=matches[2]})
				tg.sendMessage(msg.chat_id_, msg.id_, 1, '`'..matches[2]..'` *Message Has Been Removed*', 1, 'md')
            end
        end
    end
end
return {
    patterns = {
        '^[!#/]([Rr]msg) (%d*)$',
    },
    run = run
}
