local function delmsg (i,data)
    msgs = i.msgs 
    for k,v in pairs(data.messages_) do
        msgs = msgs - 1
        tg.deleteMessages(v.chat_id_,{[0] = v.id_}, dl_cb, cmd)
        if msgs == 1 then
            tg.deleteMessages(data.messages_[0].chat_id_,{[0] = data.messages_[0].id_}, dl_cb, cmd)
            return false
        end
    end
    tg.getChatHistory(data.messages_[0].chat_id_, data.messages_[0].id_,0 , 100, delmsg, {msgs=msgs})
end
local function run(msg, matches)
local group = load_data('bot/group.json')
local addgroup = group[tostring(msg.chat_id)]
    if addgroup and matches[1] == 'rmsg' and is_owner(msg) or is_momod(msg) then
            if tonumber(matches[2]) > 150 or tonumber(matches[2]) < 1 then
                --return  ''
                tg.sendMessage(msg.chat_id, msg.id_, 1, '*More than* 1 *and less than* 150\n\n`Channel:` @LeaderCh', 1, 'md')
            else
    tg.getChatHistory(msg.chat_id, msg.id_,0 , 100, delmsg, {msgs=matches[2]})
   -- return  
    tg.sendMessage(msg.chat_id, msg.id_, 1, '['..matches[2]..'] *Message has been removed*\n\nChannel: @LeaderCh', 1, 'md')        
            end
    end
end
return {
    patterns = {
        '^[!#/]([Rr]msg) (%d*)$',
    },
    run = run
}
