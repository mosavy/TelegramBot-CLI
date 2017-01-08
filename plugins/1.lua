local function run(msg,matches) 
if is_sudo then
if matches [1] == 'echo' then 
text = matches[2]
tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
end
end
end
return {
    patterns = {
       "^[#!/]([Ee]cho) (.*)$",
       "^!!!edit:[#!/]([Ee]cho) (.*)$",
  } run = run
 }
