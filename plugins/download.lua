
local function run(msg,matches) 
if is_sudo then
   if matches[1] == 'download' then 
   tg.downloadFile(matches[2])
   text = "Downloading File..."
   tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
   text1 = "█ 10"
   tg.editMessageText(text, 0, 1, text1, 1, 'html')
   text2 = "██ 20"
   tg.editMessageText(text1, 0, 1, text2, 1, 'html')
   text3 = "███ 30 "
   tg.editMessageText(text2, 0, 1, text3, 1, 'html')
   text4 = "████ 40"
   tg.editMessageText(text3, 0, 1, text4, 1, 'html')
   text5 = "█████ 50"
   tg.editMessageText(text4, 0, 1, text5, 1, 'html')
   text6 = "██████ 60"
   tg.editMessageText(text5, 0, 1, text6, 1, 'html')
   text7 = "███████ 70"
   tg.editMessageText(text6, 0, 1, text7, 1, 'html')
   text8 = "████████ 80"
   tg.editMessageText(text7, 0, 1, text8, 1, 'html')
   text9 = "█████████ 90"
   tg.editMessageText(text8, 0, 1, text9, 1, 'html')
   text10 = "██████████ 100"
   tg.editMessageText(text9, 0, 1, text10, 1, 'html')
   text11 = "Send File..."
   tg.editMessageText(text10, 0, 1, text11, 1, 'html')
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
