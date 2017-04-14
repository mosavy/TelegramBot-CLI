local function run(msg, matches)
 local group = load_data('bot/group.json')
 local addgroup = group[tostring(msg.chat_id)]
 if addgroup and is_owner(mag) then
  if matches[1] == 'clean' and matches[2] == 'modlist' then
    if next(data[tostring(msg.chat_id)]['moderators']) == nil then
     tg.sendMessage(msg.chat_id_, msg.id_, 1,'*Not moderators in this group*\n\nChannel: @LeaderCh', 1, 'md')
            end
    for k,v in pairs(data[tostring( msg.chat_id)]['moderators']) do
     data[tostring(msg.chat_id)]['moderators'][tostring(k)] = nil
     save_data(_config.group.data, group)
    end
    tg.sendMessage(msg.chat_id_, msg.id_, 1,'*All moderators has been demoted*\n\nChannel: @LeaderCh', 1, 'md')
         end
end
end
end
return {
 patterns ={
  "^[!/#]([Cc]lean) ([Mm]odlist)$"
 },
 run=run,
}
