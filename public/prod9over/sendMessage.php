<?php
if(isset($_POST['message'])){
	
	$messages = strip_tags($_POST["message"]);
			$messages = trim($messages);
			$messages = htmlspecialchars($messages);
			$rest 		= substr($messages, 0,64);
			$file 		= 'a_messges.txt';
			$date_var2 	= date("y.m.d H:i:s");
			$current 	= $date_var2." : ".$rest."\n";
			file_put_contents($file, $current, FILE_APPEND | LOCK_EX);
	
	
	/*
	if (!$handle = fopen("logs.txt", 'a')) {
			exit;
		}
		// Записываем $somecontent в наш открытый файл.
		if (fwrite($handle, $_POST['message'].'|'.date('Y-m-d H:m:s')."\n") === FALSE) {
			//echo "Не могу произвести запись в файл ('$uid.txt')";
			exit;
		}
		fclose($handle); */
}