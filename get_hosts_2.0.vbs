' - 选择： 
'				-hosts --- hosts_plus  ---- nothing
'	   		   |           |
'          OK        选择
'	   		 							 |
'			  			___________________
'		  				|				 |        |
'	  			 hosts   reset   nothing
'	   					|			   |
' 					 OK       OK


var=MsgBox ("是   ：  获取标准 hosts 并替换 ；"+vbCrlf+vbCrlf+"否   ：  获取 hosts （屏蔽广告版）并替换；"+vbCrlf+vbCrlf+"取消：  不做任何改变；"+vbCrlf+"",vbYesNoCancel  + vbDefaultButton3 ,"请选择") 'vbMsgBoxHelpButton （help ）,vbExclamation(图标)
If Var=vbYes Then 

iLocal=LCase("C:\Windows\System32\drivers\etc\hosts") 
iRemote=LCase("https://raw.githubusercontent.com/Zakariyya/yami_hosts/master/hosts") 

Set xPost=createObject("Microsoft.XMLHTTP") 
xPost.Open "GET",iRemote,0 
xPost.Send() 
set sGet=createObject("ADODB.Stream") 
sGet.Mode=3 
sGet.Type=1 
sGet.Open() 
sGet.Write xPost.ResponseBody 
sGet.SaveToFile iLocal,2
msgbox"The hosts update completed...GoodTime"

ELSE If Var=vbNo Then
iLocal=LCase("C:\Windows\System32\drivers\etc\hosts") 
iRemote=LCase("https://raw.githubusercontent.com/Zakariyya/yami_hosts/master/hosts_plus") 

Set xPost=createObject("Microsoft.XMLHTTP") 
xPost.Open "GET",iRemote,0 
xPost.Send() 
set sGet=createObject("ADODB.Stream") 
sGet.Mode=3 
sGet.Type=1 
sGet.Open() 
sGet.Write xPost.ResponseBody 
sGet.SaveToFile iLocal,2
mb=msgbox("PS： hosts_plus 因文件自定义屏蔽的内容可能导致部分网站不正常显示"+vbCrlf+vbCrlf+"      若影响浏览，请换回 标准版 / 重置 hosts 文件"+vbCrlf+vbCrlf+"***"+vbCrlf+vbCrlf+"是   ：  将获取标准 hosts 并替换 ；"+vbCrlf+vbCrlf+"否   ：  将重置 hosts 原始文件；"+vbCrlf+vbCrlf+"取消：  将继续使用 hosts (屏蔽广告版)",vbYesNoCancel  , "请选择")

If mb=vbYes Then 

iLocal=LCase("C:\Windows\System32\drivers\etc\hosts") 
iRemote=LCase("https://raw.githubusercontent.com/Zakariyya/yami_hosts/master/hosts") 

Set xPost=createObject("Microsoft.XMLHTTP")
xPost.Open "GET",iRemote,0 
xPost.Send() 
set sGet=createObject("ADODB.Stream") 
sGet.Mode=3 
sGet.Type=1 
sGet.Open() 
sGet.Write xPost.ResponseBody 
sGet.SaveToFile iLocal,2
msgbox"The hosts update completed...GoodTime"

ELSE If mb=vbNo Then 
	msgbox"The hosts was reset completed"+vbCrlf+vbCrlf+"Thanks for  using"
dim fso, f
set fso = createobject("scripting.filesystemobject")
set f = fso.CreateTextFile("C:\Windows\System32\drivers\etc\hosts", true) '第二个参数表示目标文件存在时是否覆盖

'f.Write("写入内容")

f.WriteLine("# Copyright (c) 1993-2006 Microsoft Corp.")
f.WriteLine("#")
f.WriteLine("# This is a sample HOSTS file used by Microsoft TCP/IP for Windows.")
f.WriteLine("#")
f.WriteLine("# This file contains the mappings of IP addresses to host names. Each")
f.WriteLine("# entry should be kept on an individual line. The IP address should")
f.WriteLine("# be placed in the first column followed by the corresponding host name.")
f.WriteLine("# The IP address and the host name should be separated by at least one")
f.WriteLine("# space.")
f.WriteLine("#")
f.WriteLine("# Additionally, comments (such as these) may be inserted on individual")
f.WriteLine("# lines or following the machine name denoted by a '#' symbol.")
f.WriteLine("#")
f.WriteLine("# For example:")
f.WriteLine("#")
f.WriteLine("#      102.54.94.97     rhino.acme.com          # source server")
f.WriteLine("#       38.25.63.10     x.acme.com              # x client host")
f.WriteLine("# localhost name resolution is handle within DNS itself.")
f.WriteLine("#       127.0.0.1       localhost")
f.WriteLine("#       ::1             localhost")

'f.WriteBlankLines(3) '写入三个空白行（相当于在文本编辑器中按三次回车）
f.Close()
set f = nothing
set fso = nothing

ELSE
End if
End if
End if
End if