
local function run(msg, matches)
if is_sudo and is_owner and is_momod then
   if matches[1] == 'info' then
   tg.getUserFull(matches[2]) = info
   text = info
   tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
   elseif 
   text = "Not User."
   tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
   end
  end
 end
 return {
    patterns = {
    "^[!#/]([Ii]nfo) (.*)$"
 --   "^!!!edit:[!#/]([i]nfo) (.*)$"
    },
   run = run
 }
