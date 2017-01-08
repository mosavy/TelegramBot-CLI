local function run(msg, matches)
 addgroup = group[tostring(msg.chat_id)]
if addgroup then	
if matches[1] == 'echo' and is_sudo(msg) then		
pm = matches[2]
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
end	
if matches[1] == 'git pull' and is_sudo(msg) then
  io.popen("git pull")
  tg.sendMessage(msg.chat_id_, 0, 1, ' âœ… âœ… git pullâœ… âœ…  ', 1, 'md')
end	
end
end	
return {
  patterns = {
		"^[/#!](git pull)$",
		"^[/#!](id)$",
  },
  run = run
}
