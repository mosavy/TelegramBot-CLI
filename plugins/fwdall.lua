local function run(msg, matches)
if is_sudo(msg)then
if matches[1] == 'fwdall' and msg.reply_to_message_id_ then
    --local all = load_data(_config.group.data)
      local all = 1001099370718  
    local id = msg.reply_to_message_id_
    for i = 1, #all do
      tdcli_function({
        ID = "ForwardMessages",
        chat_id_ = all[i],
        from_chat_id_ = msg.chat_id_,
        message_ids_ = {
          [0] = id
        },
        disable_notification_ = 0,
        from_background_ = 1
      }, dl_cb, nil)
    end
    return "Sent!"
  end
end
end

return { 
patterns ={ 
'^[!/#]([Ff]wdall)$'
  },
  run = run
}
