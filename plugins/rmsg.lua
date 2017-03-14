local function delmsg (arg,data)
    --msgs = i.msgs 
    for k,v in pairs(data.messages_) do
       -- msgs = msgs - 1
        tg.deleteMessages(v.chat_id_,{[0] = v.id_})
       --[[ if msgs == 1 then
            tg.deleteMessages(naji.messages_[0].chat_id_,{[0] = naji.messages_[0].id_})
            return false
        end]]
    end
    --tg.getChatHistory(naji.messages_[0].chat_id_, naji.messages_[0].id_,0 , 100, delmsg, nil)
end
local function run(msg, matches)
    local group = load_data('bot/group.json')
    local addgroup = group[tostring(msg.chat_id)]
    if matches[1] == 'rmsg' and is_owner(msg) or is_momod(msg)  then
        if addgroup then 
            if tonumber(matches[2]) > 40 or tonumber(matches[2]) < 1 then
                pm = '*More than* `1` *and less than* `40`'
                tg.sendMessage(msg.chat_id_, msg.id_, 1, pm, 1, 'md')
            else
				--  tg.getChatHistory(msg.chat_id_, msg_id,0 , 100, delmsg, {msgs=matches[2]})
				tg.getChatHistory(msg.chat_id_, 0, tonumber(matches[2]), delmsg, nil)
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
