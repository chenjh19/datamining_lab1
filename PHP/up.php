<?php
date_default_timezone_set('Asia/Shanghai');

if ($_FILES["file"]["error"] > 0)
{
	echo "Error: " .  $_FILES["file"]["error"] . "<br />";
}
else
{
//	echo "Temp File:" . $_FILES["file"]["tmp_name"] . "<br />";
//	echo "FileName:" . $_FILES["file"]["name"] . "<br />";
	$FileName = explode(".",$_FILES["file"]["name"]);
	$FileExName = $FileName[count($FileName)-1];
//	echo $FileExName ."<br />";
//	echo date('Y-m-d_His') . "." . $FileExName;
	$FileDate = date('Y-m-d_His');
	copy($_FILES["file"]["tmp_name"] , "upload/" . $FileDate . "." .$FileExName);
	move_uploaded_file($_FILES["file"]["tmp_name"],"D:\SCUT\�����ھ�ʵ������\���ֳ���\in.jpg");
	$command = "matlab -nojvm -nodesktop -nodisplay -nosplash -singleCompThread -wait -r Run -sd \"D:\SCUT\�����ھ�ʵ������\���ֳ���\"";
	exec($command);
	
	$FileRunSVMOut = fopen("D:\SCUT\�����ھ�ʵ������\���ֳ���\RunSVMOut.txt" , "r") or die ("Matlab����ļ�����");
	$Result = fread($FileRunSVMOut, filesize("D:\SCUT\�����ھ�ʵ������\���ֳ���\RunSVMOut.txt"));
	fclose($FileRunSVMOut);
	
	echo "<img src = \"upload/" . $FileDate . "." .$FileExName . "\"><br />";
	echo "ʶ����Ϊ: " . $Result;
	
	$FileSVMLog = fopen("SVMlog.txt", "a");
	fwrite($FileSVMLog, $FileDate . "." .$FileExName . "\tʶ����Ϊ: " . $Result . "\n");
	fclose($FileSVMLog);
}
?>