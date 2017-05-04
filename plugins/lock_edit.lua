local function run(msg, matches)
local group = load_data('bot/group.json')	
local chat = msg.chat_id_
local user = msg.sender_user_id_
local TIME_CHECK = 2    
local addgroup = group[tostring(msg.chat_id)]
if addgroup and not is_owner(msg) or not is_momod(msg) then
if is_momod(msg) or is_robot(msg) then
return false
else
local group = load_data('bot/group.json')
		
local group_edit_lock = group[tostring(msg.chat_id)]['settings']['lock_edit']
--local is_edit_msg = msg.text:match("!!!edit:" .. msg.text_)
if data.ID == 'UpdateMessageEdited' and group_edit_lock == 'yes' then
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
