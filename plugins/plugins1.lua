do

local function plugin_enabled( name )
  for k,v in pairs(_config.enabled_plugins) do
    if name == v then
      return k
    end
  end
  return false
end

local function plugin_exists( name )
  for k,v in pairs(plugins_names()) do
    if name..'.lua' == v then
      return true
    end
  end
  return false
end

local function list_all_plugins(only_enabled)
  local text = ''
  local nsum = 0
  for k, v in pairs( plugins_names( )) do
    local status = '❌'
    nsum = nsum+1
    nact = 0
    for k2, v2 in pairs(_config.enabled_plugins) do
      if v == v2..'.lua' then 
        status = '✔' 
      end
      nact = nact+1
    end
    if not only_enabled or status == '✔' then
      v = string.match (v, "(.*)%.lua")
      text = text..nsum..'.'..status..' '..v..' \n'
    end
  end
  local text = text..'\n\n'..nsum..' Installed plugins\n\n'..nact..' Enable plugins\n\n'..nsum-nact..' Disable plugins'
  tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
  end

local function list_plugins(only_enabled)
  local text = ''
  local nsum = 0
  for k, v in pairs( plugins_names( )) do
    local status = '❌'
    nsum = nsum+1
    nact = 0
    for k2, v2 in pairs(_config.enabled_plugins) do
      if v == v2..'.lua' then 
        status = '✔' 
      end
      nact = nact+1
    end
    if not only_enabled or status == '✔' then
      v = string.match (v, "(.*)%.lua")
    end
  end
  local text = text..'\nPlugins have been updated\n\n'..nact..' Enable plugins\n'..nsum..' Installed plugins\n'
  tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
end

local function enable_plugin( plugin_name )
  print('checking if '..plugin_name..' exists')
  if plugin_enabled(plugin_name) then
    text =  'Plugin [ '..plugin_name..' ] Enable'
	  tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
  elseif plugin_exists(plugin_name) then
    table.insert(_config.enabled_plugins, plugin_name)
    print(plugin_name..' added to _config table')
	text = 'Plugin [ '..plugin_name..' ] Enable'
	tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
    save_config()
    return reloadplugins( )
  else
    text = 'Plugin [ '..plugin_name..' ] does not exists'
	tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
  end
end

local function disable_plugin( name, chat )
  if not plugin_exists(name) then
    text = 'Plugin [ '..name..' ] does not exists'
	tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
  end
  local k = plugin_enabled(name)
  if not k then
    text = 'Plugin [ '..name..' ] Disable'
	tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
  end
  table.remove(_config.enabled_plugins, k)
  save_config( )
  text = 'Plugin [ '..name..' ] Disable'
	tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
  return reloadplugins(true)    
end

local function run(msg, matches)
  if matches[1] == 'plugins' and is_sudo(msg) then 
    return list_all_plugins()
  end

  if matches[1] == '+' and is_sudo(msg) then 
      if is_momod(msg) then
    local plugin_name = matches[2]
    print("enable: "..matches[2])
    return enable_plugin(plugin_name)
  end
    end
  if matches[1] == '-' and is_sudo(msg) then 
    if matches[2] == 'plugins' then
    	text 'This plugin can\'t be disabled'
		tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
    end
    print("disable: "..matches[2])
    return disable_plugin(matches[2])
  end
  if matches[1] == 'update' and is_sudo(msg) then --after changed to moderator mode, set only sudo
  text = 'Updated'
	tg.sendMessage(msg.chat_id_, 0, 1, text, 1, 'html')
    return reloadplugins(true)
  end
end

return {
  patterns = {
    "^[/#!](plugins)$",
	"^[/#!](update)$",
    "^[/#!]plugins? (+) ([%w_%.%-]+)$",
    "^[/#!]plugins? (-) ([%w_%.%-]+)$",
	"^!!!edit:[/#!]plugins? (-) ([%w_%.%-]+)$",
	"^!!!edit:[/#!]plugins? (-) ([%w_%.%-]+)$",
	"^!!!edit:[/#!]plugins? (-) ([%w_%.%-]+)$",
	"^!!!edit:[/#!]plugins? (-) ([%w_%.%-]+)$",
    },
  run = run,
}

end
