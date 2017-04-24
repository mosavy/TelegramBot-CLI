local function run(msg, matches)
if is_sudo(msg)then
if matches[1] == 'get' and matches[2] then

sendDocument(msg.chat_id_, 0, 0, 1, nil, '/plugins/'.. matches[2] ..'.lua')
end
end
end

return { 
patterns ={ 
'^[!/#](get) (.*)$'
  },
  run = run
}
