local function run(msg, matches)
local group = load_data('bot/group.json')	
local addgroup = group[tostring(msg.chat_id)]	
if matches[1] == 'help' and is_momod(msg) or is_owner(msg) and addgroup then
pm1 = [[🔴⚜🔐help lock🔐⚜🔴

🔹!lock links  =>قفل لینک 
🔹!lock fwd  =>قفل فروارد 
🔹!lock spam  =>قفل اسپم 
🔹!lock inline  =>قفل اینلاین 
🔹!lock arabic  =>قفل فارسی 
🔹!lock english => قفل اینگلیسی
🔹!lock fosh => قفل فُش
🔹!lock username(@) => قفل یوزرنیم 
🔹!lock sticker  =>قفل استیکر 
🔹!lock tag(#)  =>قفل تگ 
🔹!lock tgservice  =>قفل تیجی 
🔹!lock audio  =>قفل موزیک
🔹!lock voice => قفل وویس
🔹!lock photo  =>قفل تصویر 
🔹!lock gifs  =>قفل گیف 
🔹!lock video  =>قفل فیلم 
🔹!lock documents  =>قفل فایل 
🔹!lock contact =>قفل شماره
🔹!lock location => قفل موقعیت مکانی 
🔹!lock game => قفل بازی		
🔹!mute all  => سایلنت گپ
🔹!unmute all => خارج کردن گپ از سایلنت 

🔴برای غیر فعال کردن قفل ها بجای lock کلمه unlock قرار دهید
------------------------------------------------------------------------
🔵👤help Mod👤🔵

🔺!promote [id-reply] =>مدیر کردن فرد 

🔻!demote [id-reply] =>حذف فرداز مدیریت 

🔺!settings =>تنظیمات 
		
🔺!setlink [link] =>تنظیم لینک گروه

🔻!link =>دریافت لینک گروه

🔺!setrules [text] =>تنظیم قوانین گروه

🔻!rules =>دریافت قوانین گروه 
------------------------------------------------------------------------
📢Channel: @leaderCh ]]
  tg.sendMessage(msg.chat_id_, 0, 1, pm1, 1, 'md')
end
end
	
return {
  patterns = {
  "^[/#!](help)$",
		
  },
  run = run
}
