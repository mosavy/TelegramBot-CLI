local function run(msg, matches)
local addgroup = group[tostring(msg.chat_id)]	
if matches[1] == 'echo' and is_sudo(msg) then		
pm = matches[2]
tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'html')
end	
if matches[1] == 'git pull' and is_sudo(msg) then
  io.popen("git pull")
  tg.sendMessage(msg.chat_id_, 0, 1, '✅✅✅git pull✅✅✅', 1, 'md')
end	
	if matches[1] == 'help' and is_momod(msg) or is_owner(msg) and addgroup then

pm = ' 🔴⚜🔐help lock🔐⚜🔴\n\n

🔹!lock links  =>قفل لینک 
\n🔹!lock fwd  =>قفل فروارد 
\n🔹!lock spam  =>قفل اسپم 
\n🔹!lock inline  =>قفل اینلاین 
\n🔹!lock arabic  =>قفل فارسی 
\n🔹!lock english => قفل اینگلیسی
\n🔹!lock fosh => قفل فُش
\n🔹!lock username(@) => قفل یوزرنیم
\n🔹!lock bots  =>قفل بات API 
\n🔹!lock sticker  =>قفل استیکر 
\n🔹!lock tag(#)  =>قفل تگ 
\n🔹!lock tgservice  =>قفل تیجی 
\n🔹!lock audio  =>قفل موزیک
\n🔹 !lock voice => قفل وویس
\n🔹!lock photo  =>قفل تصویر 
\n🔹!lock gifs  =>قفل گیف 
\n🔹!lock video  =>قفل فیلم 
\n🔹!lock documents  =>قفل فایل 
\n🔹!mute all  => سایلنت گپ

\n\n🔴برای غیر فعال کردن قفل ها بجای lock کلمه unlock قرار دهید
\n-------------------------------------------
\n🔵👤help Mod👤🔵\n\n

🔺!promote [id-reply] =>مدیر کردن فرد 

\n\n🔻!demote [id-reply] =>حذف فرداز مدیریت 

\n\n🔺!settings =>تنظیمات 

\n\n🔻!muteuser [id-reply] =>\n
سایلنت کردن فرد/خارج کردن فرد از سایلنت 
\n-------------------------------------------\n
📢Channel: @leaderCh '
  tg.sendMessage(msg.chat_id_, 0, 1, pm, 1, 'md')
end
end
	
return {
  patterns = {
		"^[/#!](git pull)$",
		"^[/#!](echo)$",
		"^[/#!](help)$",
  },
  run = run
}
