
local function run(msg, matches)
local group = load_data('bot/group.json')
local addgroup = group[tostring(msg.chat_id)]
local setowner = redis:get('setowner'..msg.chat_id_)
local promote = redis:get('promote'..msg.chat_id_)
local demote = redis:get('demote'..msg.chat_id_)
if addgroup then
    if matches[1] == 'owner' and is_owner(msg) or is_sudo(msg) then
	 pm = group[tostring(msg.chat_id_)]['set_owner']
	 tg.sendMessage(msg.chat_id_, 0, 1,'owner['..pm..']', 1, 'html')
	end
    if setowner then
         group[tostring(msg.chat_id_)]['set_owner'] = tostring(msg.from_id)
         save_data(_config.group.data, group)
         tg.sendMessage(msg.chat_id, 0, 0,  'Group owner by ['..setowner..'] to ['..msg.from_id..'] changed', 0)
		 redis:del('setowner'..msg.chat_id_ ,true)
    end
if promote then
         group[tostring(msg.chat_id_)]['moderators'][tostring(msg.from_id)]  = tostring(msg.from_id)
         save_data(_config.group.data, group)
pm = msg.from_id..' has been promote'
         tg.sendMessage(msg.chat_id_, 0, 1,pm, 1, 'html')
		 redis:del('promote'..msg.chat_id_ ,true)
    end
if demote then
         group[tostring(msg.chat_id_)]['moderators'][tostring(msg.from_id)] = nil
         save_data(_config.group.data, group)
pm = msg.from_id..' has been demoted'
         tg.sendMessage(msg.chat_id_, 0, 1,pm, 1, 'html')
		 redis:del('demote'..msg.chat_id_ ,true)
    end
	if matches[1] == 'setowner' and is_owner(msg) or is_sudo(msg) then
	if msg.reply_to_message_id_ ~= 0 then
		tg.getMessage(msg.chat_id_,msg.reply_to_message_id_)
		redis:set('setowner'..msg.chat_id_,msg.from_id)
		redis:set('message:tg','setowner')
	elseif tonumber(matches[2]) then
	     group[tostring(msg.chat_id_)]['set_owner'][tostring(matches[2])] = matches[2]
             save_data(_config.group.data, group)
         tg.sendMessage(msg.chat_id, 0, 0,  'User added as owner', 0)
	end
	end
if matches[1] == 'promote' and is_owner(msg) or is_sudo(msg) then
	if msg.reply_to_message_id_ ~= 0 then
		tg.getMessage(msg.chat_id_,msg.reply_to_message_id_)
		redis:set('promote'..msg.chat_id_,msg.from_id)
		redis:set('message:tg','setowner')
	elseif tonumber(matches[2]) then
	     group[tostring(msg.chat_id_)]['moderators'][tostring(matches[2])] = matches[2]
             save_data(_config.group.data, group)
         tg.sendMessage(msg.chat_id, 0, 0,  'User has been promote', 0)
	end
	end

if matches[1] == 'demote' and is_owner(msg) or is_sudo(msg) then
	if msg.reply_to_message_id_ ~= 0 then
		tg.getMessage(msg.chat_id_,msg.reply_to_message_id_)
		redis:set('demote'..msg.chat_id_,msg.from_id)
		redis:set('message:tg','setowner')
	elseif tonumber(matches[2]) then
	     group[tostring(msg.chat_id_)]['moderators'][tostring(matches[2])] = nil
             save_data(_config.group.data, group)
         tg.sendMessage(msg.chat_id, 0, 0,  'User has been demoted', 0)
	end
	end

end
end
return {
  patterns = {
    "^[#!/](setowner)$",
 "^[#!/](owner)$",
	"^[#!/](setowner) (.+)$",
    "^[#!/](promote)$",
	"^[#!/](promote) (.+)$",
    "^[#!/](demote)$",
	"^[#!/](demote) (.+)$",
	"^(ownerset)$",
  },
  run = run
}
