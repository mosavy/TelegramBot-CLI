<?php
define('API_KEY','350507593:AAGRop7slMyWTdc9elYc_2cxCU1RdBuAnBw');
//----######------
function makereq($method,$datas=[]){
    $url = "https://api.telegram.org/bot".API_KEY."/".$method;
    $ch = curl_init();
    curl_setopt($ch,CURLOPT_URL,$url);
    curl_setopt($ch,CURLOPT_RETURNTRANSFER,true);
    curl_setopt($ch,CURLOPT_POSTFIELDS,http_build_query($datas));
    $res = curl_exec($ch);
    if(curl_error($ch)){
        var_dump(curl_error($ch));
    }else{
        return json_decode($res);
    }
}
//##############=--API_REQ
function apiRequest($method, $parameters) {
  if (!is_string($method)) {
    error_log("Method name must be a string\n");
    return false;
  }
  if (!$parameters) {
    $parameters = array();
  } else if (!is_array($parameters)) {
    error_log("Parameters must be an array\n");
    return false;
  }
  foreach ($parameters as $key => &$val) {
    // encoding to JSON array parameters, for example reply_markup
    if (!is_numeric($val) && !is_string($val)) {
      $val = json_encode($val);
    }
  }
  $url = "https://api.telegram.org/bot".API_KEY."/".$method.'?'.http_build_query($parameters);
  $handle = curl_init($url);
  curl_setopt($handle, CURLOPT_RETURNTRANSFER, true);
  curl_setopt($handle, CURLOPT_CONNECTTIMEOUT, 5);
  curl_setopt($handle, CURLOPT_TIMEOUT, 60);
  return exec_curl_request($handle);
}
//----######------
//---------
$update = json_decode(file_get_contents('php://input'));
var_dump($update);
//=========
$chat_id = $update->message->chat->id;
$message_id = $update->message->message_id;
$from_id = $update->message->from->id;
$name = $update->message->from->first_name;
$username = $update->message->from->username;
$textmessage = isset($update->message->text)?$update->message->text:'';
$txtmsg = $update->message->text;
$reply = $update->message->reply_to_message->forward_from->id;
$stickerid = $update->message->reply_to_message->sticker->file_id;
$admin = 187807271;
$step = file_get_contents("data/".$from_id."/step.txt");
$ban = file_get_contents('data/banlist.txt');
//-------
function SendMessage($ChatId, $TextMsg)
{
 makereq('sendMessage',[
'chat_id'=>$ChatId,
'text'=>$TextMsg,
'parse_mode'=>"MarkDown"
]);
}
function SendSticker($ChatId, $sticker_ID)
{
 makereq('sendSticker',[
'chat_id'=>$ChatId,
'sticker'=>$sticker_ID
]);
}
function Forward($KojaShe,$AzKoja,$KodomMSG)
{
makereq('ForwardMessage',[
'chat_id'=>$KojaShe,
'from_chat_id'=>$AzKoja,
'message_id'=>$KodomMSG
]);
}
function save($filename,$TXTdata)
	{
	$myfile = fopen($filename, "w") or die("Unable to open file!");
	fwrite($myfile, "$TXTdata");
	fclose($myfile);
	}
//===========
$inch = file_get_contents("https://api.telegram.org/bot".API_KEY."/getChatMember?chat_id=@LeaderCh&user_id=".$from_id);
	
	if (strpos($inch , '"status":"left"') !== false ) {
SendMessage($chat_id,"براي استفاده رايگان از اين ربات بايد اول در کانال عضو شويد.\n@LeaderCh");
}
if (strpos($ban , "$from_id") !== false  ) {
SendMessage($chat_id,"You Are Banned From Server.\nDon't Message Again...\n---------------------------------------–\nلطفا پيامي ارسال نکنيد دسترسي شما به اين سرور مسدود شده است");
	}

elseif(isset($update->callback_query)){
    $callbackMessage = '';
    var_dump(makereq('answerCallbackQuery',[
        'callback_query_id'=>$update->callback_query->id,
        'text'=>$callbackMessage
    ]));
    $chat_id = $update->callback_query->message->chat->id;
    
    $message_id = $update->callback_query->message->message_id;
    $data = $update->callback_query->data;
    if (strpos($data, "del") !== false ) {
    $botun = str_replace("del ","",$data);
    unlink("bots/".$botun."/index.php");
    save("data/$chat_id/bots.txt","");
    save("data/$chat_id/tedad.txt","0");
    var_dump(
        makereq('editMessageText',[
            'chat_id'=>$chat_id,
            'message_id'=>$message_id,
            'text'=>"ربات شما با موفقيت حذف شده\n---------------------------------\n Robot has ben deleted!",
            'reply_markup'=>json_encode([
                'inline_keyboard'=>[
                    [
                        ['text'=>"به کانال ما بپيونديد - Pease join to my channel",'url'=>"https://telegram.me/LeaderCh"]
                    ]
                ]
            ])
        ])
    );
 }
 else {
    var_dump(
        makereq('editMessageText',[
            'chat_id'=>$chat_id,
            'message_id'=>$message_id,
            'text'=>"خطا-Error",
            'reply_markup'=>json_encode([
                'inline_keyboard'=>[
                    [
                        ['text'=>"به کانال ما بپيونديد - Pleas join to my channel",'url'=>"https://telegram.me/LeaderCh"]
                    ]
                ]
            ])
        ])
    );
 }
}

elseif ($textmessage == 'برگشت - Back') {
save("data/$from_id/step.txt","none");
var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>"به منوي اصلي ربات خوش امديد :)\n---------------------------------\n Welcome To Main Menu :)",
		'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
  [
                   ['text'=>"فارسي"],['text'=>"English"]          
]
                
            	],
            	'resize_keyboard'=>true
       		])
    		]));
}
elseif ($step == 'delete') {
$botun = $txtmsg ;
if (file_exists("bots/".$botun."/index.php")) {

$src = file_get_contents("bots/".$botun."/index.php");

if (strpos($src , $from_id) !== false ) {
save("data/$from_id/step.txt","none");
unlink("bots/".$botun."/index.php");
var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>"ربات شما با موفقيت پاک شد]\nيک ربات جديد بسازيد \n-----------------------------------------------\nYur Robot has ben deleted \nPlease create new bot",
		'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
                [
                   ['text'=>"/start"]
                ]
                
            	],
            	'resize_keyboard'=>true
       		])
    		]));
}
else {
SendMessage($chat_id,"خطا!!!\nشما نميتوانيد اين ربات را پاک کنيد \n-------------------------------------------\nError \nYou cant delete this bot");
}
}
else {
SendMessage($chat_id,"درخواست شما يافت نشد\n---------------------------\n Not found");
}
}
elseif ($step == 'create bot') {
$token = $textmessage ;

			$userbot = json_decode(file_get_contents('https://api.telegram.org/bot'.$token .'/getme'));
			//==================
			function objectToArrays( $object ) {
				if( !is_object( $object ) && !is_array( $object ) )
				{
				return $object;
				}
				if( is_object( $object ) )
				{
				$object = get_object_vars( $object );
				}
			return array_map( "objectToArrays", $object );
			}

	$resultb = objectToArrays($userbot);
	$un = $resultb["result"]["username"];
	$ok = $resultb["ok"];
		if($ok != 1) {
			//Token Not True
			SendMessage($chat_id,"توکن ارسالي نامعتبر است\n-----------------------------------\nYour token is invalid");
		}
		else
		{
		SendMessage($chat_id,"لطفا منتظر بمانيد \nدرحال ساخت ربات...\n Please wite\nare creating bot...");
		if (file_exists("bots/$un/index.php")) {
		$source = file_get_contents("bot/index.php");
		$source = str_replace("**TOKEN**",$token,$source);
		$source = str_replace("**ADMIN**",$from_id,$source);
		save("bots/$un/index.php",$source);	
		file_get_contents("https://leaderbot.000webhostapp.com/bot".$token."/setwebhook?url=https://webhook/bots/$un/index.php");

var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>" ربات شما با موفقيت ساخته شد\n[براي ورود به ربات خود کليک کنيد](https://telegram.me/$un) \n-------------------------------------------\nYour Robot Has ben Created\n[start Bot](https://telegram.me/$un)",
		'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
                [
                   ['text'=>"برگشت - Back"]
                ]
                
            	],
            	'resize_keyboard'=>true
       		])
    		]));
		}
		else {
		save("data/$from_id/tedad.txt","1");
		save("data/$from_id/step.txt","none");
		save("data/$from_id/bots.txt","$un");
		
		mkdir("bots/$un");
		mkdir("bots/$un/data");
		mkdir("bots/$un/data/btn");
		mkdir("bots/$un/data/words");
		mkdir("bots/$un/data/profile");
		mkdir("bots/$un/data/setting");
		
		save("bots/$un/data/blocklist.txt","");
		save("bots/$un/data/last_word.txt","");
		save("bots/$un/data/pmsend_txt.txt","Message Sent!");
		save("bots/$un/data/start_txt.txt","Hello World!");
		save("bots/$un/data/forward_id.txt","");
		save("bots/$un/data/users.txt","$from_id\n");
		mkdir("bots/$un/data/$from_id");
		save("bots/$un/data/$from_id/type.txt","admin");
		save("bots/$un/data/$from_id/step.txt","none");
		
		save("bots/$un/data/btn/btn1_name","");
		save("bots/$un/data/btn/btn2_name","");
		save("bots/$un/data/btn/btn3_name","");
		save("bots/$un/data/btn/btn4_name","");
		
		save("bots/$un/data/btn/btn1_post","");
		save("bots/$un/data/btn/btn2_post","");
		save("bots/$un/data/btn/btn3_post","");
		save("bots/$un/data/btn/btn4_post","");
	
		save("bots/$un/data/setting/sticker.txt","");
		save("bots/$un/data/setting/video.txt","");
		save("bots/$un/data/setting/voice.txt","");
		save("bots/$un/data/setting/file.txt","");
		save("bots/$un/data/setting/photo.txt","");
		save("bots/$un/data/setting/music.txt","");
		save("bots/$un/data/setting/forward.txt","");
		save("bots/$un/data/setting/joingp.txt","");
		
		$source = file_get_contents("bot/index.php");
		$source = str_replace("**TOKEN**",$token,$source);
		$source = str_replace("**ADMIN**",$from_id,$source);
		save("bots/$un/index.php",$source);	
		file_get_contents("https://leaderbot.000webhostapp.com/bot".$token."/setwebhook?url=https://webhook/bots/$un/index.php");

var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>" ربات شما با موفقيت ساخته شد\n[براي ورود به ربات خود کليک کنيد](https://telegram.me/$un) \n-----------------------------------------------------------Your Robot Has ben Created\n[start Bot](https://telegram.me/$un)",		
                'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
                [
                   ['text'=>"برگشت - Back"]
                ]
                
            	],
            	'resize_keyboard'=>true
       		])
    		]));
		}
}
}
elseif (strpos($textmessage, "/setvip") !== false) {
$botun = str_replace("/setvip ","",$textmessage);
SendMessage($chat_id,"$textmessage");
/*$src = file_get_contents("bots/$botun/index.php");
$nsrc = str_replace("**free**","gold",$src);
save("data/$botun/index.php",$nsrc);
SendMessage($chat_id,"Updated!");*/
}
elseif (strpos($textmessage , "/toall") !== false ) {
if ($from_id == $admin) {
$text = str_replace("/toall","",$textmessage);
$fp = fopen( "data/users.txt", 'r');
while( !feof( $fp)) {
 $users = fgets( $fp);
SendMessage($users,"$text");
}
}
else {
SendMessage($chat_id,"You Are Not Admin");
}
}
elseif (strpos($textmessage , "/feedback") !== false ) {
if ($from_id == $ban) {
$text = str_replace("/feedback","",$textmessage);
SendMessage($chat_id,"نظر شما با موفقيت ارسال شد\n---------------------------------\n Your comment has been sent");
SendMessage($admin,"FeedBack : \n name: $name \n username: $username \n id: $from_id\n Text: $text");
}
else {
SendMessage($chat_id,"You Are banned");
}
}
elseif (strpos($textmessage , "/report") !== false ) {
if ($from_id == $ban) {
$text = str_replace("/report","",$textmessage);
SendMessage($chat_id,"بعد از تاييد ربات از سرور اخراج ميشود\n---------------------------------------------\nRobots Ben from server is later confirmed");
SendMessage($admin,"Report : \n name: $name \n username: $username \n id: $from_id\n Bot: $text");
}
else {
SendMessage($chat_id,"You Are banned");
}
}
elseif($textmessage == 'رباتهاي من')
{
$botname = file_get_contents("data/$from_id/bots.txt");
if ($botname == "") {
SendMessage($chat_id,"شما هنوز هيچ رباتي نساخته ايد!!!");
return;
}
 	var_dump(makereq('sendMessage',[
	'chat_id'=>$update->message->chat->id,
	'text'=>"ليست رباتهاي شما: ",
	'parse_mode'=>'MarkDown',
	'reply_markup'=>json_encode([
	'inline_keyboard'=>[
	[
	['text'=>"ً@".$botname,'url'=>"https://telegram.me/".$botname]
	]
	]
	])
	]));
}
elseif($textmessage == 'ًmy robots')
{
$botname = file_get_contents("data/$from_id/bots.txt");
if ($botname == "") {
SendMessage($chat_id,"You still have not robots!");
return;
}
 	var_dump(makereq('sendMessage',[
	'chat_id'=>$update->message->chat->id,
	'text'=>"Your Bot Lists : ",
	'parse_mode'=>'MarkDown',
	'reply_markup'=>json_encode([
	'inline_keyboard'=>[
	[
	['text'=>"ً@".$botname,'url'=>"https://telegram.me/".$botname]
	]
	]
	])
	]));
}
elseif($textmessage == '/start' )
{
if (!file_exists("data/$from_id/step.txt")) {
mkdir("data/$from_id");
save("data/$from_id/step.txt","none");
save("data/$from_id/tedad.txt","0");
save("data/$from_id/bots.txt","");
$myfile2 = fopen("data/users.txt", "a") or die("Unable to open file!"); 
fwrite($myfile2, "$from_id\n");
fclose($myfile2);
}

var_dump(makereq('sendMessage',[
         'chat_id'=>$update->message->chat->id,
         'text'=>"Please Select your Language.\n---------------------------------\nلطفا زبان خود را انتخاب کنيد.",
  'parse_mode'=>'MarkDown',
         'reply_markup'=>json_encode([
             'keyboard'=>[
[
                   ['text'=>"فارسي"],['text'=>"English"]          
]
             ],
             'resize_keyboard'=>true
         ])
      ]));
}
elseif($textmessage == 'تغيير زبان' )
{
if (!file_exists("data/$from_id/step.txt")) {
mkdir("data/$from_id");
save("data/$from_id/step.txt","none");
save("data/$from_id/tedad.txt","0");
save("data/$from_id/bots.txt","");
$myfile2 = fopen("data/users.txt", "a") or die("Unable to open file!"); 
fwrite($myfile2, "$from_id\n");
fclose($myfile2);
}

var_dump(makereq('sendMessage',[
         'chat_id'=>$update->message->chat->id,
         'text'=>"Please Select your Language.\n---------------------------------\nلطفا زبان خود را انتخاب کنيد.",
  'parse_mode'=>'MarkDown',
         'reply_markup'=>json_encode([
             'keyboard'=>[
[
                   ['text'=>"فارسي"],['text'=>"English"]          
]
             ],
             'resize_keyboard'=>true
         ])
      ]));
}
elseif($textmessage == 'ًLanguage' )
{
if (!file_exists("data/$from_id/step.txt")) {
mkdir("data/$from_id");
save("data/$from_id/step.txt","none");
save("data/$from_id/tedad.txt","0");
save("data/$from_id/bots.txt","");
$myfile2 = fopen("data/users.txt", "a") or die("Unable to open file!"); 
fwrite($myfile2, "$from_id\n");
fclose($myfile2);
}

var_dump(makereq('sendMessage',[
         'chat_id'=>$update->message->chat->id,
         'text'=>"Please Select your Language.\n---------------------------------\nلطفا زبان خود را انتخاب کنيد.",
  'parse_mode'=>'MarkDown',
         'reply_markup'=>json_encode([
             'keyboard'=>[
[
                   ['text'=>"فارسي"],['text'=>"English"]          
]
             ],
             'resize_keyboard'=>true
         ])
      ]));
}
elseif($textmessage == 'English')
{

if (!file_exists("data/$from_id/step.txt")) {
mkdir("data/$from_id");
save("data/$from_id/step.txt","none");
save("data/$from_id/tedad.txt","0");
save("data/$from_id/bots.txt","");
$myfile2 = fopen("data/users.txt", "a") or die("Unable to open file!"); 
fwrite($myfile2, "$from_id\n");
fclose($myfile2);
}

var_dump(makereq('sendMessage',[
         'chat_id'=>$update->message->chat->id,
         'text'=>"Hello\n\nWellCome To PvResan Robot\n\nwith this Service you can Provide Support  your Robot Mmbers , Channel , Groups and  Websites\n\nTo Create Robot Select Create a Robot' Button!",
  'parse_mode'=>'MarkDown',
         'reply_markup'=>json_encode([
             'keyboard'=>[
                [
                   ['text'=>"Create a bot"],['text'=>"my robots"],['text'=>"Delete a Robot"]
                ],
                [
                   ['text'=>"help"],['text'=>"rules"]
                ],
                     [
                   ['text'=>"Send Comment"],['text'=>"Robot Report"]
                ],
[
                   ['text'=>"Language"]          
]
             ],
             'resize_keyboard'=>true
         ])
      ]));
}
elseif($textmessage == 'فارسی' )
{

if (!file_exists("data/$from_id/step.txt")) {
mkdir("data/$from_id");
save("data/$from_id/step.txt","none");
save("data/$from_id/tedad.txt","0");
save("data/$from_id/bots.txt","");
$myfile2 = fopen("data/users.txt", "a") or die("Unable to open file!"); 
fwrite($myfile2, "$from_id\n");
fclose($myfile2);
}

var_dump(makereq('sendMessage',[
         'chat_id'=>$update->message->chat->id,
         'text'=>"سلام به سرويس پيام رسان تلگرام خوش آمديد.\n\nبا استفاده از اين سرويس شما ميتوانيد رباتي جهت ارِئه به کاربران ربات, کانال,گروه يا وبسايتخود ايجاد کنيد\n\nبراي ساخت ربات ربات ميتوانيد از دکمه ساخت ربات استفاده کنيد ",
  'parse_mode'=>'MarkDown',
         'reply_markup'=>json_encode([
             'keyboard'=>[
                [
                   ['text'=>"ساخت ربات"],['text'=>"رباتهاي من"],['text'=>"حذف ربات"]
                ],
                [
                   ['text'=>"راهنما"],['text'=>"قوانين"]
                ],
                [
                   ['text'=>"ارسال نظر"],['text'=>"گزارش تخلف"]
                ],
           [
                ['text'=>"تغيير زبان"]
            ]
                
             ],
             'resize_keyboard'=>true
         ])
      ]));
}
elseif($textmessage == 'قوانين') {
SendMessage($chat_id, "1) مسئوليت پيامهاي رد و بدل شده در هر ربات با مدير آن ربات ميباشد و گروه ليدر هيچ گونه مسئوليتي قبول نميکند.\n\n2) ايجاد ربات با عنوانهاي مبتذل و خارج از عرف جامعه که براي جذب آمار و فروش محصولات غير معارف باشد ممنوع ميباشد و در صورت مشاهده حذف و مسودو ميگردد\n\n3) اطلاعات ثبت شده در رباتهاي ساخته شده توسط pvceator از قبيل اطلاعات پروفايل نزد مديران pvcreator محفوظ هست و در اختيار اشخاص حقيقي يا حقوقي قرار نميگيرد.\n\n4) رباتهايي که اقدام به انتشار مطالب يا تصاوير مستحجن کنند يا به مذاهب,اديان ويا موميتي توهين کنند مسدود خواهند شد\n\n5) ساخت هرگونه ربات و فعاليت در زمينه Hacking يا Sexology خلاف قوانين است درصورت برخورد صاحب ربات و ربات ساخته شده از سرور ما مسدود خواهد شد\n\n6) در صورت مشاهده استفاده از قابليتهاي ربات در جهات منفي مانند Spam يا Hack کاربران تلگرام شديدا برخورد ميشود و تمام اطلاعات شخص مورد نظر به مراجع قضايي گزارش ميشود\n\n7) اگر تعداد درخواستهاي ربات شما به سرور ما بيش از حد معمول باشد و همچنين ربات شما VIP نباشد چند بار به شما خطاري داده ميشود. اگر اين اخطار ناديده گرفته شود ربات شما به صورت اتوماتيک به حالت تعليق در مي آيد");
}
elseif($textmessage == 'ًrules') {
SendMessage($chat_id, "1) Recorded data in robots made by PvResan such as profile data , are preserved to PvResan's managers and will not be available for real or juridical people.\n\n 2) Robots that publish obscene pictures or subjects and insult the officials , religions and nations and races , will be blocked.\n\n3) Creating a robot with vulgar titles and out of norm of society which absorbs the statistics and selling offbeat products are prohibited and in case of witnessing  intended robot will be deleted and blocked.\n\n4) The responsibility of exchanged messages in each robot is with the manager of that robot and PvResan does not accept any responsibilities.\n\n5) Respecting the privacy and rights of individuals is necessary. Including no offense to religious , political and juridical figures of the country specially robot users.");
}
elseif($textmessage == 'راهنما') {
SendMessage($chat_id, "ربات پيام ريان چيست؟\n\nربات پيام رسان به شما اين امکان را ميدهد تا با مخاطب هايتان که ريپورت شده اند يا به هر دليلي نميتوانند به شما به صورت خصوصي پيام دهند صحبت کنيد\n\nبرخي ويژگيهاي ربات پيام رسان:\n\nسرعت بالا\n1)ارسال مطالب به تمام کاربران يا تمام گروه ها\n2) قفل کردن ارسال عکس, فيلم,استيکر, فايل, وويس, آهنگ بصورت مجزا\n3) قفل کردن فروارد در ربات\n4) قفل کردن عضويت ربات در گروه ها\n5) مشاهده تعداد اعضا و گروه ها و يوزرنيم 10 کاربر تازه عضو شده\n6) قرار دادن افراد در ليست سياه و بن کردن آنها\n7) قابليت شير کردن شماره شما به صورت سريع\nو چندين ويژگي ديگر...");
}
elseif($textmessage == 'help') {
SendMessage($chat_id, "What PvResan do?\n\nWith this Service you can Provide Support  your Robot Mmbers , Channel , Groups and  Websites\n\nSome of this Service Features :\n\nFast Server\n\n1) Send Mesage To Members Or Groups Or Both\n2) Lock Sending Photos , Videos , Stickers , Documents , Voices and Audios Separately\n3) Lock Forward To your Robot\n4) Lock Adding Your Robots To Groups\n5) Check Robot Membes And Groups\n6) Check Your Black List\n7) Put Members To Black List\n8) Fast Share Your Contact\nAnd several other features ...\n\nFor information about how to get a token from @botFather use");
}
elseif($textmessage == 'ارسال نظر' ) {
SendMessage($chat_id, "نظرات شما به پيشرفت و ارائه خدمات بهتر کمک ميکند.\n\nبراي ارسال نظرات خود از دستور زير استماده کنيد.\n\n/feedback (پيام خود را بنويسيد)");
}
	elseif($textmessage == 'گزارش تخلف' ) {
SendMessage($chat_id, "اگر رباتي بر خلاف قوانين ما عمل ميکند با دستور زير به ما خبر دهيد\n\n/report (usernamebot)");
}
elseif($textmessage == 'Send Comment') {
SendMessage($chat_id, "ں–ٹ Your Comments Help Us To Be Better.\n\nًں“‌ To Send Comment Use this Command Below.\n\n/feedback (Your Message)");
}
	elseif($textmessage ==  'Robot Report') {
SendMessage($chat_id, "If the robot to act contrary to our laws let us know using the following command\n/report (usernamebot)");
}
elseif ($textmessage == 'حذف ربات' ) {
if (file_exists("data/$from_id/step.txt")) {

}
$botname = file_get_contents("data/$from_id/bots.txt");
if ($botname == "") {
SendMessage($chat_id,"شما هنوز هيچ رباتي نساخته ايد!!!");

}
else {
//save("data/$from_id/step.txt","delete");


 	var_dump(makereq('sendMessage',[
	'chat_id'=>$update->message->chat->id,
	'text'=>"يکي از رباتهاي خود را انتخاب کنيد: ",
	'parse_mode'=>'MarkDown',
	'reply_markup'=>json_encode([
	'inline_keyboard'=>[
	[
	['text'=>"@".$botname,'callback_data'=>"del ".$botname]
	]
	]
	])
	]));

/*
var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>"يکي از رباتهاي خود را جهت پاک کردن انتخاب کنيد: ",
		'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
            	[
            	['text'=>$botname]
            	],
                [
                   ['text'=>"برگشت"]
                ]
                
            	],
            	'resize_keyboard'=>true
       		])
    		])); */
}
}
elseif ($textmessage == 'Delete a Robot' ) {
if (file_exists("data/$from_id/step.txt")) {

}
$botname = file_get_contents("data/$from_id/bots.txt");
if ($botname == "") {
SendMessage($chat_id,"Do robots have not");

}
else {
//save("data/$from_id/step.txt","delete");


 	var_dump(makereq('sendMessage',[
	'chat_id'=>$update->message->chat->id,
	'text'=>"Select one of your robots:",
	'parse_mode'=>'MarkDown',
	'reply_markup'=>json_encode([
	'inline_keyboard'=>[
	[
	['text'=>"@".$botname,'callback_data'=>"del ".$botname]
	]
	]
	])
	]));

/*
var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>"يکي از رباتهاي خود را جهت پاک کردن انتخاب کنيد: ",
		'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
            	[
            	['text'=>$botname]
            	],
                [
                   ['text'=>"برگشت"]
                ]
                
            	],
            	'resize_keyboard'=>true
       		])
    		])); */
}
}
elseif ($textmessage == 'Delete a Robot' ) {
if (file_exists("data/$from_id/step.txt")) {

}
$botname = file_get_contents("data/$from_id/bots.txt");
if ($botname == "") {
SendMessage($chat_id,"Do robots have not");

}
else {
//save("data/$from_id/step.txt","delete");


 	var_dump(makereq('sendMessage',[
	'chat_id'=>$update->message->chat->id,
	'text'=>"Select one of your robots:",
	'parse_mode'=>'MarkDown',
	'reply_markup'=>json_encode([
	'inline_keyboard'=>[
	[
	['text'=>"@".$botname,'callback_data'=>"del ".$botname]
	]
	]
	])
	]));

/*
var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>"يکي از رباتهاي خود را جهت پاک کردن انتخاب کنيد: ",
		'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
            	[
            	['text'=>$botname]
            	],
                [
                   ['text'=>"برگشت"]
                ]
                
            	],
            	'resize_keyboard'=>true
       		])
    		])); */
}
}
elseif ($textmessage == 'ساخت ربات' ) {

$tedad = file_get_contents("data/$from_id/tedad.txt");
if ($tedad >= 1) {
SendMessage($chat_id,"تعداد ربات هاي ساخته شده شما زياد است \nاول يکي را پاک کنيد $tedad");
return;
}
save("data/$from_id/step.txt","create bot");
var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>"توکن ربات را وارد کنيد: ",
		'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
                [
                   ['text'=>"برگشت - Back"]
                ]
                
            	],
            	'resize_keyboard'=>true
       		])
    		]));
}
elseif ($textmessage == 'ًCreate a Robot') {

$tedad = file_get_contents("data/$from_id/tedad.txt");
if ($tedad >= 1) {
SendMessage($chat_id," The number of robots you $ tedad
Each person can only build other robots you can build a robot");
return;
}
save("data/$from_id/step.txt","create bot");
var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>"Please send your token ",
		'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
                [
                   ['text'=>"برگشت - Back"]
                ]
                
            	],
            	'resize_keyboard'=>true
       		])
    		]));
}
	elseif (strpos($textmessage , "/ban" ) !== false ) {
if ($from_id == $admin) {
$text = str_replace("/ban","",$textmessage);
$myfile2 = fopen("data/banlist.txt", 'a') or die("Unable to open file!");	
fwrite($myfile2, "$text\n");
fclose($myfile2);
SendMessage($admin,"شما کاربر $text را در ليست بن قرار داديد\n\nبراي در اوردن اين کاربر از ليست بن از دستور زير استفاده کنيد\n/unban $text");
}
else {
SendMessage($chat_id,"شما ادمين نيستيد");
}
}

elseif (strpos($textmessage , "/unban" ) !== false ) {
if ($from_id == $admin) {
$text = str_replace("/unban","",$textmessage);
			$newlist = str_replace($text,"",$ban);
			save("data/banlist.txt",$newlist);
SendMessage($admin,"شما کاربر $text را از ليست بن دراورديد");
}
else {
SendMessage($chat_id,"شما ادمين نيستيد");
}
}
	
else
{
SendMessage($chat_id,"پيام شما پيدا نشد\n------------------------------------------\n Your command could not be found");
}
?>
