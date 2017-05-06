local function run(msg, matches)
local addgroup = group[tostring(msg.chat_id)]
if addgroup and not is_owner(msg) or not is_momod(msg) then
if is_momod(msg) or is_robot(msg) then
return false
else
if msg.content_.members_ or msg.content_.members_[0].type_.ID == 'UserTypeBot' then
local gid = tonumber(msg.chat_id_)
local uid = msg.sender_user_id_
local aid = msg.content_.members_[0].id_
local id = msg.id_
local group_lock_bot = group[tostring(msg.chat_id)]['settings']['lock_bot']
if group_lock_bot == 'yes' then
tg.changeChatMemberStatus(gid, aid, 'Kicked')
tg.changeChatMemberStatus(gid, uid, 'Kicked')
--kick_user(gid, aid)
--kick_user(gid, uid)          
end
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
