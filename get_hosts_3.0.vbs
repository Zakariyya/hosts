set fso1=createobject("scripting.filesystemobject")
set ws=wscript.createobject("wscript.shell")
fso1.createtextfile("C:\Windows\System32\drivers\etc\racaljk.txt")

set fso2=createobject("scripting.filesystemobject")
set ws=wscript.createobject("wscript.shell")
fso2.createtextfile("C:\Windows\System32\drivers\etc\vokins.txt")


iLocal=LCase("C:\Windows\System32\drivers\etc\racaljk.txt") 
iRemote=LCase("https://raw.githubusercontent.com/racaljk/hosts/master/hosts") 
Set xPost=createObject("Microsoft.XMLHTTP") 'Set Post = CreateObject("Msxml2.XMLHTTP")
xPost.Open "GET",iRemote,0 
xPost.Send()
set sGet=createObject("ADODB.Stream") 
sGet.Mode=3 
sGet.Type=1 
sGet.Open() 
sGet.Write xPost.ResponseBody 
sGet.SaveToFile iLocal,2

iLocal=LCase("C:\Windows\System32\drivers\etc\vokins.txt") 
iRemote=LCase("https://raw.githubusercontent.com/vokins/yhosts/master/hosts") 
Set xPost=createObject("Microsoft.XMLHTTP") 'Set Post = CreateObject("Msxml2.XMLHTTP")
xPost.Open "GET",iRemote,0 
xPost.Send()
set sGet=createObject("ADODB.Stream") 
sGet.Mode=3 
sGet.Type=1 
sGet.Open() 
sGet.Write xPost.ResponseBody 
sGet.SaveToFile iLocal,2



Const ForReading = 1   
Set fso = CreateObject( "Scripting.FileSystemObject" )   
Set outputFile = fso.CreateTextFile( "C:\Windows\System32\drivers\etc\hosts",true )   
  
Set textFile = fso.OpenTextFile("C:\Windows\System32\drivers\etc\racaljk.txt", ForReading )   
strText = textFile.ReadAll   
textFile.Close   
outputFile.WriteLine strText   
  
Set textFile = fso.OpenTextFile("C:\Windows\System32\drivers\etc\vokins.txt", ForReading )   
strText = textFile.ReadAll   
textFile.Close   
outputFile.WriteLine strText  


fso1.DeleteFile("C:\Windows\System32\drivers\etc\racaljk.txt")
fso2.DeleteFile("C:\Windows\System32\drivers\etc\vokins.txt")

