local function run(msg, matches)
if is_sudo then
   if matches[1] == 'block' then
     tg.blockUser(matches[2])
     text= matches[2].."is a blocked."
     tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
    -- user_id = matches[2]
   --  redis:set('blocklist',user_id)
    elseif matches[1] == 'unblock' then
    tg.unblockUser(matches[2])
    text=matches[2].."is a Unblocked."
     tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
    -- redis:del('blocklist',user_id)
     elseif matches[1] == 'blocklist' then
    tg.getBlockedUsers(0,50)
    text = getBlockedUsers
     tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
      end
      end
  end
 end 
return {
    patterns = {
       "^[#!/]([Bb]lock) (.*)$",
       "^[#!/]([Uu]nblock) (.*)$",
       "^[#!/]([Bb]locklist)$",
     --  "^!!!edit:[#!/]([Bb]lock) (.*)$",
    --   "^!!!edit:[#!/]([Uu]nblock) (.*)$",
    --   "^!!!edit:[#!/]([Bb]locklist)$",
    },
   run = run
 }
