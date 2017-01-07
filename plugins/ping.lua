local function run(msg, matches)
tg.sendMessage(msg.chat_id, 0, 0,  "Update", 0)
end
return {
  patterns = {
    	"^[!#/]([Uu][Pp][Dd][Aa][Tt][Ee])$",
  },
  run = run
}
