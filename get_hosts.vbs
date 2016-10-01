msgbox"Running now, Please wait..."
iLocal=LCase("C:\Windows\System32\drivers\etc\hosts") 
iRemote=LCase("https://raw.githubusercontent.com/Zakariyya/yami_hosts/master/hosts_plus") 

Set xPost=createObject("Microsoft.XMLHTTP") 'Set Post = CreateObject("Msxml2.XMLHTTP")
xPost.Open "GET",iRemote,0 
xPost.Send() 
set sGet=createObject("ADODB.Stream") 
sGet.Mode=3 
sGet.Type=1 
sGet.Open() 
sGet.Write xPost.ResponseBody 
sGet.SaveToFile iLocal,2
msgbox"update completed...GoodTime"
