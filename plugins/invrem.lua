local function run(msg, matches)
local group = load_data('bot/group.json')
local addgroup = group[tostring(msg.chat_id)]
   if addgroup then
    if matches[1] == 'invrem' and is_owner(msg) then
            tg.getChannelMembers(msg.chat_id_, 0, "Kicked", 200, function (i, leader)
                for k,v in pairs(leader.members_) do
                    tg.addChatMember(i.chat_id_, v.user_id_, 3--[[, dl_cb, nil]])
                end
            end, {
            chat_id=msg.chat_id_
            })
            tg.sendMessage(msg.chat_id_, 0, 1, '*Members kicked from the Group ,invited to group*', 1, 'md')
        end
     end
end

return { 
patterns = { 
   "^[!/#]([Ii]nvrem)$", 
}, 
run = run 
}
