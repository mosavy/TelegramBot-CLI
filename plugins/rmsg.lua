
local function history(extra, suc, result)
  for i=1, #result do
    delete_msg(result[i].id, ok_cb, false)
  end
  if tonumber(extra.con) == #result then
    pm = 'message has been removed!'
    tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
--    send_msg(extra.chatid, '"'..#result..'" message has been removed!', ok_cb, false)
  else
    pm = 'Removing has been finished'
    tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
--    send_msg(extra.chatid, 'Removing has been finished.', ok_cb, false)
  end
end

--Functions.
function run(msg, matches)
  local addgroup = group[tostring(msg.chat_id)]
if addgroup then
        if matches[1] == 'rmsg' and is_owner(msg) or is_sudo(msg) then
            if msg.to.type == 'channel' then
                if tonumber(matches[2]) > 40 or tonumber(matches[2]) < 1 then
                    return "More than 1 and less than 40"
                end
                get_history(msg.to.peer_id, matches[2] + 1 , history , {msg.chat_id_ = msg.to.peer_id, con = matches[2]})
            else
                return "Only for supergroup!"
            end
        elseif matches[1] == 'rmsg' and not is_owner(msg) then
            return "For owner only!"
        end

end
  end

return {
  patterns = {
 "^[!/#](rmsg) (%d*)$",
  },
  run = run,
}
