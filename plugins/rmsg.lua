
local function run(msg, matches)
    --local msg_id = msg.id_
    local group = load_data('bot/group.json')
    local addgroup = group[tostring(msg.chat_id)]
    if matches[1] == 'rmsg' and is_owner(msg) or is_momod(msg)  then
        if addgroup then 
            if 40 < tonumber(num) then
                pm = '*More than* `1` *and less than* `40`'
                tg.sendMessage(msg.chat_id_, msg.id_, 1, pm, 1, 'md')
            else
                   print(num)
                   for i=1,tonumber(num) do
                    tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ - i})
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
