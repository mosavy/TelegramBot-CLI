
local function run(msg,matches) 
if is_sudo then
   if matches[1] == 'download'
   tg.downloadFile(matches[2])
   text = "Downloading File..."
   tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
   text = "█ 10"
   tg.editMessageText(msg.chat_id_, 0, 1, text, 1, 'html')
   text = "██ 20"
   tg.editMessageText(msg.chat_id_, 0, 1, text, 1, 'html')
   text = "███ 30 "
   tg.editMessageText(msg.chat_id_, 0, 1, text, 1, 'html')
   text = "████ 40"
   tg.editMessageText(msg.chat_id_, 0, 1, text, 1, 'html')
   text = "█████ 50"
   tg.editMessageText(msg.chat_id_, 0, 1, text, 1, 'html')
   text = "██████ 60"
   tg.editMessageText(msg.chat_id_, 0, 1, text, 1, 'html')
   text = "███████ 70"
   tg.editMessageText(msg.chat_id_, 0, 1, text, 1, 'html')
   text = "████████ 80"
   tg.editMessageText(msg.chat_id_, 0, 1, text, 1, 'html')
   text = "█████████ 90"
   tg.editMessageText(msg.chat_id_, 0, 1, text, 1, 'html')
   text = "██████████ 100"
   tg.editMessageText(msg.chat_id_, 0, 1, text, 1, 'html')
   text = "Send File..."
   tg.editMessageText(msg.chat_id_, 0, 1, text, 1, 'html')
   tg.getFile(matches[2])
   end
  end
end
return {
    patterns = {
       "^[#!/]([Dd]ownload) (.*)$",
       "^!!!edit:[#!/]([Dd]ownload) (.*)$",
   },
   run = run
 }
