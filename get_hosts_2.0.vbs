' - ѡ�� 
'				-hosts --- hosts_plus  ---- nothing
'	   		   |           |
'          OK        ѡ��
'	   		 							 |
'			  			___________________
'		  				|				 |        |
'	  			 hosts   reset   nothing
'	   					|			   |
' 					 OK       OK


var=MsgBox ("��   ��  ��ȡ��׼ hosts ���滻 ��"+vbCrlf+vbCrlf+"��   ��  ��ȡ hosts �����ι��棩���滻��"+vbCrlf+vbCrlf+"ȡ����  �����κθı䣻"+vbCrlf+"",vbYesNoCancel  + vbDefaultButton3 ,"��ѡ��") 'vbMsgBoxHelpButton ��help ��,vbExclamation(ͼ��)
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
mb=msgbox("PS�� hosts_plus ���ļ��Զ������ε����ݿ��ܵ��²�����վ��������ʾ"+vbCrlf+vbCrlf+"      ��Ӱ��������뻻�� ��׼�� / ���� hosts �ļ�"+vbCrlf+vbCrlf+"***"+vbCrlf+vbCrlf+"��   ��  ����ȡ��׼ hosts ���滻 ��"+vbCrlf+vbCrlf+"��   ��  ������ hosts ԭʼ�ļ���"+vbCrlf+vbCrlf+"ȡ����  ������ʹ�� hosts (���ι���)",vbYesNoCancel  , "��ѡ��")

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
set f = fso.CreateTextFile("C:\Windows\System32\drivers\etc\hosts", true) '�ڶ���������ʾĿ���ļ�����ʱ�Ƿ񸲸�

'f.Write("д������")

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

'f.WriteBlankLines(3) 'д�������հ��У��൱�����ı��༭���а����λس���
f.Close()
set f = nothing
set fso = nothing

ELSE
End if
End if
End if
End if