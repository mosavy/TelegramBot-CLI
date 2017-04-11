local function run(msg, matches)
local addgroup = group[tostring(msg.chat_id)]
if addgroup and not is_owner(msg) or not is_momod(msg) then
if is_momod(msg) or is_robot(msg) then
return false
else
local group = load_data('bot/group.json')

local group_lock_bot = group[tostring(msg.chat_id)]['settings']['lock_bot']
if group_lock_bot == 'yes'  and  data.type_.ID == "UserTypeBot" then
--tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
kick_user(data.id_, arg.chat_id)
end

end
end
end

return {
  patterns = {
    "^(.*)$",
  },
  run = run
}


function kick_user(user_id, chat_id)
if not tonumber(user_id) then
return false
end
  tdcli.changeChatMemberStatus(chat_id, user_id, 'Kicked')
end
