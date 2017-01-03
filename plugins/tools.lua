
local function reload_plugins( )
  plugins = {}
  load_plugins()
end

local function plugin_enabled( name )
  for k,v in pairs(_config.enabled_plugins) do
    if name == v then
      return k
    end
  end
  return false
end

local function enable_plugin( plugin_name )
if plugin_enabled(plugin_name) then
  reload_plugins( )
else table.insert(_config.enabled_plugins, plugin_name)
    save_config()
end
end

local function saveplug(extra, success, result)
  local msg = extra.msg
  local name = extra.name
--  local receiver = get_receiver(msg)
  if success then
    local file = 'plugins/'..name..'.lua'
    print('File saving to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    enable_plugin(name)
    print('Reloading...')
    reload_plugins( )
  else
    print('Error downloading: '..msg.id)
--    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end



function run(msg, matches)

 if is_sudo(msg) then
--    local receiver = get_receiver(msg)
    local group = msg.to.id
    
      
      if msg.reply_to_message_id_ ~= 0 and matches[1] == "save" and matches[2] then
        name = matches[2]
        load_document(msg.reply_to_message_id_, saveplug, {msg=msg,name=name})
		pm = 'Plugin '..name..' has been saved.'
		tg.sendMessage(msg.chat_id_, 0, 1,pm, 1, 'html')
      end
 end
	        if matches[1] == "delplug" and is_sudo(msg) then
			    pm = "پلاگین ["..matches[2].."] با موفقیت حذف شد"
				tg.sendMessage(msg.chat_id_, 0, 1,pm, 1, 'html')
                return io.popen("cd plugins && rm "..matches[2]..".lua")
            end 
end

return {
  patterns = {

 "^[!/#](save) (.*)$",
 "^[!/#](delplug) (.*)$",
  },
  run = run,
}
