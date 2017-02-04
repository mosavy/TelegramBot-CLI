local function run(msg, matches)
local addgroup = group[tostring(msg.chat_id)]
if addgroup and not is_owner(msg) or not is_momod(msg) then
if is_momod(msg) or is_robot(msg) then
return false
else
local group = load_data('bot/group.json')
local group_fwd_lock = group[tostring(msg.chat_id)]['settings']['lock_fwd']
if group_fwd_lock == 'yes' and msg.forward_info_ then
tg.deleteMessages(msg.chat_id_, {[0] = msg.id_ })
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
