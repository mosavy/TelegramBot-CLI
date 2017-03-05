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
SendMessage($chat_id,"ÈÑÇí ÇÓÊÝÇÏå ÑÇíÇä ÇÒ Çíä ÑÈÇÊ ÈÇíÏ Çæá ÏÑ ˜ÇäÇá ÚÖæ ÔæíÏ.\n@LeaderCh");
}
if (strpos($ban , "$from_id") !== false  ) {
SendMessage($chat_id,"You Are Banned From Server.ðŸ¤“\nDon't Message Again...ðŸ˜Ž\nâž–âž–âž–âž–âž–âž–âž–âž–âž–âž–\náØÝÇ íÇãí ÇÑÓÇá ä˜äíÏ ÏÓÊÑÓí ÔãÇ Èå Çíä ÓÑæÑ ãÓÏæÏ ÔÏå ÇÓÊ");
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
            'text'=>"ÑÈÇÊ ÔãÇ ÈÇ ãæÝÞíÊ ÍÐÝ ÔÏå\n Robot has ben deleted!",
            'reply_markup'=>json_encode([
                'inline_keyboard'=>[
                    [
                        ['text'=>"Èå ˜ÇäÇá ãÇ ÈíæäÏíÏ - Pease join to my channel",'url'=>"https://telegram.me/LeaderCh"]
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
            'text'=>"Ø®Ø·Ø§-Error",
            'reply_markup'=>json_encode([
                'inline_keyboard'=>[
                    [
                        ['text'=>"Èå ˜ÇäÇá ãÇ ÈíæäÏíÏ - Pleas join to my channel",'url'=>"https://telegram.me/LeaderCh"]
                    ]
                ]
            ])
        ])
    );
 }
}

elseif ($textmessage == 'ÈÑÔÊ - Back') {
save("data/$from_id/step.txt","none");
var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>"Èå ãäæí ÇÕáí ÑÈÇÊ ÎæÔ ÇãÏíÏ :)\n---------------------------------\n Welcome To Main Menu :)",
		'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
  [
                   ['text'=>"ÝÇÑÓí"],['text'=>"English ðŸ‡¦ðŸ‡º"]          
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
        	'text'=>"ÑÈÇÊ ÔãÇ ÈÇ ãæÝÞíÊ Ç˜ ÔÏ]\ní˜ ÑÈÇÊ ÌÏíÏ ÈÓÇÒíÏ \n-----------------------------------------------\nYur Robot has ben deleted \nPlease create new bot",
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
SendMessage($chat_id,"ÎØÇ!!!\nÔãÇ äãíÊæÇäíÏ Çíä ÑÈÇÊ ÑÇ Ç˜ ˜äíÏ \n-------------------------------------------\nError \nYou cant delete this bot");
}
}
else {
SendMessage($chat_id,"ÏÑÎæÇÓÊ ÔãÇ íÇÝÊ äÔÏ\n---------------------------\n Not found");
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
			SendMessage($chat_id,"Êæ˜ä ÇÑÓÇáí äÇãÚÊÈÑ ÇÓÊ\n-----------------------------------\nYour token is invalid");
		}
		else
		{
		SendMessage($chat_id,"áØÝÇ ãäÊÙÑ ÈãÇäíÏ \nÏÑÍÇá ÓÇÎÊ ÑÈÇÊ...\n Please wite...\nare creating bot...");
		if (file_exists("bots/$un/index.php")) {
		$source = file_get_contents("bot/index.php");
		$source = str_replace("**TOKEN**",$token,$source);
		$source = str_replace("**ADMIN**",$from_id,$source);
		save("bots/$un/index.php",$source);	
		file_get_contents("https://leaderbot.000webhostapp.com/bot".$token."/setwebhook?url=https://webhook/bots/$un/index.php");

var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>" ÑÈÇÊ ÔãÇ ÈÇ ãæÝÞíÊ ÓÇÎÊå ÔÏ\n[ÈÑÇí æÑæÏ Èå ÑÈÇÊ ÎæÏ ˜áí˜ ˜äíÏ](https://telegram.me/$un) \n-----------------------------------------------------------Your Robot Has ben Created\n[start Bot](https://telegram.me/$un)",
		'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
                [
                   ['text'=>"ÈÑÔÊ - Back"]
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
	
		save("bots/$un/data/setting/sticker.txt","âœ…");
		save("bots/$un/data/setting/video.txt","âœ…");
		save("bots/$un/data/setting/voice.txt","âœ…");
		save("bots/$un/data/setting/file.txt","âœ…");
		save("bots/$un/data/setting/photo.txt","âœ…");
		save("bots/$un/data/setting/music.txt","âœ…");
		save("bots/$un/data/setting/forward.txt","âœ…");
		save("bots/$un/data/setting/joingp.txt","âœ…");
		
		$source = file_get_contents("bot/index.php");
		$source = str_replace("**TOKEN**",$token,$source);
		$source = str_replace("**ADMIN**",$from_id,$source);
		save("bots/$un/index.php",$source);	
		file_get_contents("https://leaderbot.000webhostapp.com/bot".$token."/setwebhook?url=https://webhook/bots/$un/index.php");

var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>" ÑÈÇÊ ÔãÇ ÈÇ ãæÝÞíÊ ÓÇÎÊå ÔÏ\n[ÈÑÇí æÑæÏ Èå ÑÈÇÊ ÎæÏ ˜áí˜ ˜äíÏ](https://telegram.me/$un) \n-----------------------------------------------------------Your Robot Has ben Created\n[start Bot](https://telegram.me/$un)",		
                'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
                [
                   ['text'=>"ÈÑÔÊ - Back"]
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
SendMessage($chat_id,"äÙÑ ÔãÇ ÈÇ ãæÝÞíÊ ÇÑÓÇá ÔÏ\n---------------------------------\n Your comment has been sent");
SendMessage($admin,"FeedBack : \n name: $name \n username: $username \n id: $from_id\n Text: $text");
}
else {
SendMessage($chat_id,"You Are banned");
}
}
elseif (strpos($textmessage , "/report") !== false ) {
if ($from_id == $ban) {
$text = str_replace("/report","",$textmessage);
SendMessage($chat_id,"ÈÚÏ ÇÒ ÊÇííÏ ÑÈÇÊ ÇÒ ÓÑæÑ ÇÎÑÇÌ ãíÔæÏ\nRobots Ben from server is later confirmed");
SendMessage($admin,"Report : \n name: $name \n username: $username \n id: $from_id\n Bot: $text");
}
else {
SendMessage($chat_id,"You Are banned");
}
}
elseif($textmessage == 'ÑÈÇÊåÇí ãä')
{
$botname = file_get_contents("data/$from_id/bots.txt");
if ($botname == "") {
SendMessage($chat_id,"ÔãÇ åäæÒ åí ÑÈÇÊí äÓÇÎÊå ÇíÏ!!!");
return;
}
 	var_dump(makereq('sendMessage',[
	'chat_id'=>$update->message->chat->id,
	'text'=>"áíÓÊ ÑÈÇÊåÇí ÔãÇ: ",
	'parse_mode'=>'MarkDown',
	'reply_markup'=>json_encode([
	'inline_keyboard'=>[
	[
	['text'=>"ðŸ‘‰ @".$botname,'url'=>"https://telegram.me/".$botname]
	]
	]
	])
	]));
}
elseif($textmessage == 'ðŸš€ my robots')
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
	['text'=>"ðŸ‘‰ @".$botname,'url'=>"https://telegram.me/".$botname]
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
         'text'=>"Please Select your Language.\n---------------------------------\náØÝÇ ÒÈÇä ÎæÏ ÑÇ ÇäÊÎÇÈ ˜äíÏ.",
  'parse_mode'=>'MarkDown',
         'reply_markup'=>json_encode([
             'keyboard'=>[
[
                   ['text'=>"ÝÇÑÓí"],['text'=>"English ðŸ‡¦ðŸ‡º"]          
]
             ],
             'resize_keyboard'=>true
         ])
      ]));
}
elseif($textmessage == 'ÊÛííÑ ÒÈÇä' )
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
         'text'=>"Please Select your Language.\n---------------------------------\náØÝÇ ÒÈÇä ÎæÏ ÑÇ ÇäÊÎÇÈ ˜äíÏ.",
  'parse_mode'=>'MarkDown',
         'reply_markup'=>json_encode([
             'keyboard'=>[
[
                   ['text'=>"ÝÇÑÓí"],['text'=>"English ðŸ‡¦ðŸ‡º"]          
]
             ],
             'resize_keyboard'=>true
         ])
      ]));
}
elseif($textmessage == 'ðŸ‡¦ðŸ‡º Language ðŸ‡®ðŸ‡·' )
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
         'text'=>"Please Select your Language.\n---------------------------------\náØÝÇ ÒÈÇä ÎæÏ ÑÇ ÇäÊÎÇÈ ˜äíÏ.",
  'parse_mode'=>'MarkDown',
         'reply_markup'=>json_encode([
             'keyboard'=>[
[
                   ['text'=>"ÝÇÑÓí"],['text'=>"English ðŸ‡¦ðŸ‡º"]          
]
             ],
             'resize_keyboard'=>true
         ])
      ]));
}
elseif($textmessage == 'English ðŸ‡¦ðŸ‡º')
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
         'text'=>"HelloðŸ‘‹ðŸ˜‰

ðŸ”¹ WellCome To PvResan Robot ðŸŒ¹

ðŸ”¸ with this Service you can Provide Support  your Robot Mmbers , Channel , Groups and  Websites 

ðŸ”¹ To Create Robot Select 'ðŸ”„ Create a Robot' Button!",
  'parse_mode'=>'MarkDown',
         'reply_markup'=>json_encode([
             'keyboard'=>[
                [
                   ['text'=>"ðŸ”„ Create a ot"],['text'=>"ðŸš€ my robots"],['text'=>"â˜¢ Delete a Robot"]
                ],
                [
                   ['text'=>"â„¹ï¸ help"],['text'=>"ðŸ”° rules"]
                ],
                     [
                   ['text'=>"âœ… Send Comment"],['text'=>"âš ï¸ Robot Report"]
                ],
[
                   ['text'=>"ðŸ‡¦ðŸ‡º Language ðŸ‡®ðŸ‡·"]          
]
             ],
             'resize_keyboard'=>true
         ])
      ]));
}
elseif($textmessage == 'ÙØ§Ø±Ø³ÛŒ ðŸ‡®ðŸ‡·' )
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
         'text'=>"ÓáÇã Èå ÓÑæíÓ íÇã ÑÓÇä ÊáÑÇã ÎæÔ ÂãÏíÏ.\n\nÈÇ ÇÓÊÝÇÏå ÇÒ Çíä ÓÑæíÓ ÔãÇ ãíÊæÇäíÏ ÑÈÇÊí ÌåÊ ÇÑöÆå Èå ˜ÇÑÈÑÇä ÑÈÇÊ, ˜ÇäÇá,Ñæå íÇ æÈÓÇíÊÎæÏ ÇíÌÇÏ ˜äíÏ\n\nÈÑÇí ÓÇÎÊ ÑÈÇÊ ÑÈÇÊ ãíÊæÇäíÏ ÇÒ Ï˜ãå ÓÇÎÊ ÑÈÇÊ ÇÓÊÝÇÏå ˜äíÏ ",
  'parse_mode'=>'MarkDown',
         'reply_markup'=>json_encode([
             'keyboard'=>[
                [
                   ['text'=>"ðÓÇÎÊ ÑÈÇÊ"],['text'=>"ÑÈÇÊåÇí ãä"],['text'=>"ÍÐÝ ÑÈÇÊ"]
                ],
                [
                   ['text'=>"ÑÇåäãÇ"],['text'=>"ÞæÇäíä"]
                ],
                [
                   ['text'=>"ÇÑÓÇá äÙÑ"],['text'=>"ÒÇÑÔ ÊÎáÝ"]
                ],
           [
                ['text'=>"ÊÛííÑ ÒÈÇä"]
            ]
                
             ],
             'resize_keyboard'=>true
         ])
      ]));
}
elseif($textmessage == 'ÞæÇäíä') {
SendMessage($chat_id, "1) ãÓÆæáíÊ íÇãåÇí ÑÏ æ ÈÏá ÔÏå ÏÑ åÑ ÑÈÇÊ ÈÇ ãÏíÑ Âä ÑÈÇÊ ãíÈÇÔÏ æ Ñæå áíÏÑ åí æäå ãÓÆæáíÊí ÞÈæá äãí˜äÏ.\n\n2) ÇíÌÇÏ ÑÈÇÊ ÈÇ ÚäæÇäåÇí ãÈÊÐá æ ÎÇÑÌ ÇÒ ÚÑÝ ÌÇãÚå ˜å ÈÑÇí ÌÐÈ ÂãÇÑ æ ÝÑæÔ ãÍÕæáÇÊ ÛíÑ ãÚÇÑÝ ÈÇÔÏ ããäæÚ ãíÈÇÔÏ æ ÏÑ ÕæÑÊ ãÔÇåÏå ÍÐÝ æ ãÓæÏæ ãíÑÏÏ\n\n3) ÇØáÇÚÇÊ ËÈÊ ÔÏå ÏÑ ÑÈÇÊåÇí ÓÇÎÊå ÔÏå ÊæÓØ pvceator ÇÒ ÞÈíá ÇØáÇÚÇÊ ÑæÝÇíá äÒÏ ãÏíÑÇä pvcreator ãÍÝæÙ åÓÊ æ ÏÑ ÇÎÊíÇÑ ÇÔÎÇÕ ÍÞíÞí íÇ ÍÞæÞí ÞÑÇÑ äãííÑÏ.\n\n4) ÑÈÇÊåÇíí ˜å ÇÞÏÇã Èå ÇäÊÔÇÑ ãØÇáÈ íÇ ÊÕÇæíÑ ãÓÊÍÌä ˜ääÏ íÇ Èå ãÐÇåÈ,ÇÏíÇä æíÇ ãæãíÊí Êæåíä ˜ääÏ ãÓÏæÏ ÎæÇåäÏ ÔÏ\n\n5) ÓÇÎÊ åÑæäå ÑÈÇÊ æ ÝÚÇáíÊ ÏÑ Òãíäå Hacking íÇ Sexology ÎáÇÝ ÞæÇäíä ÇÓÊ ÏÑÕæÑÊ ÈÑÎæÑÏ ÕÇÍÈ ÑÈÇÊ æ ÑÈÇÊ ÓÇÎÊå ÔÏå ÇÒ ÓÑæÑ ãÇ ãÓÏæÏ ÎæÇåÏ ÔÏ\n\n6) ÏÑ ÕæÑÊ ãÔÇåÏå ÇÓÊÝÇÏå ÇÒ ÞÇÈáíÊåÇí ÑÈÇÊ ÏÑ ÌåÇÊ ãäÝí ãÇääÏ Spam íÇ Hack ˜ÇÑÈÑÇä ÊáÑÇã ÔÏíÏÇ ÈÑÎæÑÏ ãíÔæÏ æ ÊãÇã ÇØáÇÚÇÊ ÔÎÕ ãæÑÏ äÙÑ Èå ãÑÇÌÚ ÞÖÇíí ÒÇÑÔ ãíÔæÏ\n\n7) ÇÑ ÊÚÏÇÏ ÏÑÎæÇÓÊåÇí ÑÈÇÊ ÔãÇ Èå ÓÑæÑ ãÇ ÈíÔ ÇÒ ÍÏ ãÚãæá ÈÇÔÏ æ åãäíä ÑÈÇÊ ÔãÇ VIP äÈÇÔÏ äÏ ÈÇÑ Èå ÔãÇ ÎØÇÑí ÏÇÏå ãíÔæÏ. ÇÑ Çíä ÇÎØÇÑ äÇÏíÏå ÑÝÊå ÔæÏ ÑÈÇÊ ÔãÇ Èå ÕæÑÊ ÇÊæãÇÊí˜ Èå ÍÇáÊ ÊÚáíÞ ÏÑ ãí ÂíÏ");
}
elseif($textmessage == 'ðŸ”° rules') {
SendMessage($chat_id, "1âƒ£ Recorded data in robots made by PvResan such as profile data , are preserved to PvResan's managers and will not be available for real or juridical people.\n\n 2âƒ£ Robots that publish obscene pictures or subjects and insult the officials , religions and nations and races , will be blocked.\n\n3âƒ£ Creating a robot with vulgar titles and out of norm of society which absorbs the statistics and selling offbeat products are prohibited and in case of witnessing  intended robot will be deleted and blocked.\n\n4âƒ£ The responsibility of exchanged messages in each robot is with the manager of that robot and PvResan does not accept any responsibilities.\n\n5âƒ£ Respecting the privacy and rights of individuals is necessary. Including no offense to religious , political and juridical figures of the country specially robot users.");
}
elseif($textmessage == 'ÑÇåäãÇ') {
SendMessage($chat_id, "ÑÈÇÊ íÇã ÑíÇä íÓÊ¿\n\nÑÈÇÊ íÇã ÑÓÇä Èå ÔãÇ Çíä Çã˜Çä ÑÇ ãíÏåÏ ÊÇ ÈÇ ãÎÇØÈ åÇíÊÇä ˜å ÑíæÑÊ ÔÏå ÇäÏ íÇ Èå åÑ Ïáíáí äãíÊæÇääÏ Èå ÔãÇ Èå ÕæÑÊ ÎÕæÕí íÇã ÏåäÏ ÕÍÈÊ ˜äíÏ\n\nÈÑÎí æíŽíåÇí ÑÈÇÊ íÇã ÑÓÇä:\n\nÓÑÚÊ ÈÇáÇ\n1)ÇÑÓÇá ãØÇáÈ Èå ÊãÇã ˜ÇÑÈÑÇä íÇ ÊãÇã Ñæå åÇ\n2) ÞÝá ˜ÑÏä ÇÑÓÇá Ú˜Ó, Ýíáã,ÇÓÊí˜Ñ, ÝÇíá, ææíÓ, Âåä ÈÕæÑÊ ãÌÒÇ\n3) ÞÝá ˜ÑÏä ÝÑæÇÑÏ ÏÑ ÑÈÇÊ\n4) ÞÝá ˜ÑÏä ÚÖæíÊ ÑÈÇÊ ÏÑ Ñæå åÇ\n5) ãÔÇåÏå ÊÚÏÇÏ ÇÚÖÇ æ Ñæå åÇ æ íæÒÑäíã 10 ˜ÇÑÈÑ ÊÇÒå ÚÖæ ÔÏå\n6) ÞÑÇÑ ÏÇÏä ÇÝÑÇÏ ÏÑ áíÓÊ ÓíÇå æ Èä ˜ÑÏä ÂäåÇ\n7) ÞÇÈáíÊ ÔíÑ ˜ÑÏä ÔãÇÑå ÔãÇ Èå ÕæÑÊ ÓÑíÚ\næ äÏíä æíŽí ÏíÑ...");
}
elseif($textmessage == 'â„¹ï¸ help') {
SendMessage($chat_id, "What PvResan do?ðŸ¤”\n\nðŸ”¶ With this Service you can Provide Support  your Robot Mmbers , Channel , Groups and  Websites\n\nSome of this Service Features :\n\nðŸš€ Fast Server\n\n1âƒ£ Send Mesage To Members Or Groups Or Both\n2âƒ£ Lock Sending Photos , Videos , Stickers , Documents , Voices and Audios Separately\n3âƒ£ Lock Forward To your Robot\n4âƒ£ Lock Adding Your Robots To Groups\n5âƒ£ Check Robot Membes And Groups\n6âƒ£ Check Your Black List\n7âƒ£ Put Members To Black List\n8âƒ£ Fast Share Your Contact\nAnd several other features ...\n\nðŸ”´ For information about how to get a token from @botFather use");
}
elseif($textmessage == 'ÇÑÓÇá äÙÑ' ) {
SendMessage($chat_id, "äÙÑÇÊ ÔãÇ Èå íÔÑÝÊ æ ÇÑÇÆå ÎÏãÇÊ ÈåÊÑ ˜ã˜ ãí˜äÏ.\n\nÈÑÇí ÇÑÓÇá äÙÑÇÊ ÎæÏ ÇÒ ÏÓÊæÑ ÒíÑ ÇÓÊãÇÏå ˜äíÏ.\n\n/feedback (íÇã ÎæÏ ÑÇ ÈäæíÓíÏ)");
}
	elseif($textmessage == 'âš ï¸ Ú¯Ø²Ø§Ø±Ø´ ØªØ®Ù„Ù' ) {
SendMessage($chat_id, "ÇÑ ÑÈÇÊí ÈÑ ÎáÇÝ ÞæÇäíä ãÇ Úãá ãí˜äÏ ÈÇ ÏÓÊæÑ ÒíÑ Èå ãÇ ÎÈÑ ÏåíÏ\n\n/report (usernamebot)");
}
elseif($textmessage == 'âœ… Send Comment') {
SendMessage($chat_id, "ðŸ–Š Your Comments Help Us To Be Better.\n\nðŸ“ To Send Comment Use this Command Below.\n\n/feedback (Your Message)");
}
	elseif($textmessage ==  'âš ï¸ Robot Report') {
SendMessage($chat_id, "If the robot to act contrary to our laws let us know using the following command\n/report (usernamebot)");
}
elseif ($textmessage == 'ÍÐÝ ÑÈÇÊ' ) {
if (file_exists("data/$from_id/step.txt")) {

}
$botname = file_get_contents("data/$from_id/bots.txt");
if ($botname == "") {
SendMessage($chat_id,"ÔãÇ åäæÒ åí ÑÈÇÊí äÓÇÎÊå ÇíÏ!!!");

}
else {
//save("data/$from_id/step.txt","delete");


 	var_dump(makereq('sendMessage',[
	'chat_id'=>$update->message->chat->id,
	'text'=>"í˜í ÇÒ ÑÈÇÊåÇí ÎæÏ ÑÇ ÇäÊÎÇÈ ˜äíÏ: ",
	'parse_mode'=>'MarkDown',
	'reply_markup'=>json_encode([
	'inline_keyboard'=>[
	[
	['text'=>"ðŸ‘‰ @".$botname,'callback_data'=>"del ".$botname]
	]
	]
	])
	]));

/*
var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>"í˜í ÇÒ ÑÈÇÊåÇí ÎæÏ ÑÇ ÌåÊ Ç˜ ˜ÑÏä ÇäÊÎÇÈ ˜äíÏ: ",
		'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
            	[
            	['text'=>$botname]
            	],
                [
                   ['text'=>"ÈÑÔÊ"]
                ]
                
            	],
            	'resize_keyboard'=>true
       		])
    		])); */
}
}
elseif ($textmessage == 'â˜¢ Delete a Robot' ) {
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
	['text'=>"ðŸ‘‰ @".$botname,'callback_data'=>"del ".$botname]
	]
	]
	])
	]));

/*
var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>"í˜í ÇÒ ÑÈÇÊåÇí ÎæÏ ÑÇ ÌåÊ Ç˜ ˜ÑÏä ÇäÊÎÇÈ ˜äíÏ: ",
		'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
            	[
            	['text'=>$botname]
            	],
                [
                   ['text'=>"ÈÑÔÊ"]
                ]
                
            	],
            	'resize_keyboard'=>true
       		])
    		])); */
}
}
elseif ($textmessage == 'â˜¢ Delete a Robot' ) {
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
	['text'=>"ðŸ‘‰ @".$botname,'callback_data'=>"del ".$botname]
	]
	]
	])
	]));

/*
var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>"í˜í ÇÒ ÑÈÇÊåÇí ÎæÏ ÑÇ ÌåÊ Ç˜ ˜ÑÏä ÇäÊÎÇÈ ˜äíÏ: ",
		'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
            	[
            	['text'=>$botname]
            	],
                [
                   ['text'=>"ÈÑÔÊ"]
                ]
                
            	],
            	'resize_keyboard'=>true
       		])
    		])); */
}
}
elseif ($textmessage == 'ÓÇÎÊ ÑÈÇÊ' ) {

$tedad = file_get_contents("data/$from_id/tedad.txt");
if ($tedad >= 1) {
SendMessage($chat_id,"ÊÚÏÇÏ ÑÈÇÊ åÇí ÓÇÎÊå ÔÏå ÔãÇ ÒíÇÏ ÇÓÊ \nÇæá í˜í ÑÇ Ç˜ ˜äíÏ $tedad");
return;
}
save("data/$from_id/step.txt","create bot");
var_dump(makereq('sendMessage',[
        	'chat_id'=>$update->message->chat->id,
        	'text'=>"Êæ˜ä ÑÈÇÊ ÑÇ æÇÑÏ ˜äíÏ: ",
		'parse_mode'=>'MarkDown',
        	'reply_markup'=>json_encode([
            	'keyboard'=>[
                [
                   ['text'=>"ÈÑÔÊ - Back"]
                ]
                
            	],
            	'resize_keyboard'=>true
       		])
    		]));
}
elseif ($textmessage == 'ðŸ”„ Create a Robot') {

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
                   ['text'=>"ÈÑÔÊ - Back"]
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
SendMessage($admin,"ÔãÇ ˜ÇÑÈÑ $text ÑÇ ÏÑ áíÓÊ Èä ÞÑÇÑ ÏÇÏíÏ\n\nÈÑÇí ÏÑ ÇæÑÏä Çíä ˜ÇÑÈÑ ÇÒ áíÓÊ Èä ÇÒ ÏÓÊæÑ ÒíÑ ÇÓÊÝÇÏå ˜äíÏ\n/unban $text");
}
else {
SendMessage($chat_id,"ÔãÇ ÇÏãíä äíÓÊíÏ");
}
}

elseif (strpos($textmessage , "/unban" ) !== false ) {
if ($from_id == $admin) {
$text = str_replace("/unban","",$textmessage);
			$newlist = str_replace($text,"",$ban);
			save("data/banlist.txt",$newlist);
SendMessage($admin,"ÔãÇ ˜ÇÑÈÑ $text ÑÇ ÇÒ áíÓÊ Èä ÏÑÇæÑÏíÏ");
}
else {
SendMessage($chat_id,"ÔãÇ ÇÏãíä äíÓÊíÏ");
}
}
	
else
{
SendMessage($chat_id,"íÇã ÔãÇ íÏÇ äÔÏ\n------------------------------------------\n Your command could not be foundâŒ");
}
?>
