 
local function run (msg,matches)
local group = load_data('bot/group.json')
local addgroup = group[tostring(msg.chat_id)]
if addgroup and is_owner(msg) or is_momod(msg) then
  if matches[1]:lower() == 'clean' and matches[2]:lower() == 'blocklist' then
	
    local function cleanbl(ext, res)
      if tonumber(res.total_count_) == 0 then 
        return tg.sendMessage(ext.chat_id, ext.msg_id, 0, '*Blocklist is empty or maybe Bot is not groups admin*\n\n`Channel:` @LeaderCh', 1, 'md')
      end
      local x = 0
      for x,y in pairs(res.members_) do
        x = x + 1
        tg.changeChatMemberStatus(ext.chat_id, y.user_id_, 'Left', dl_cb, nil)
      end
      return tg.sendMessage(ext.chat_id, ext.msg_id, 0, '*Remove users from blocklist*\n\n`Channel:` @LeaderCh', 1, 'md')
   end
	
    return tg.getChannelMembers(msg.chat_id, 0, 'Kicked', 200, cleanbl, {chat_id = msg.chat_id_, msg_id =  msg.id_}) 
  end
end
end

return {
  patterns ={
    "^[/#!]([Cc]lean) ([Bb]locklist)$",
  },
  run = run,
}
