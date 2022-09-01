$myURI = "http://20.56.57.104:5080"



$req = (Invoke-WebRequest -URI $myURI -UseBasicParsing).Content.Split([Environment]::NewLine) | sls 'alpha' | Select -Last 1
$req =  $req | Out-String



$req = $req.Split(">")[2].Split("<")[0].Trim()



$myDownloadUrl = "$myURI/$req"




$name=$req -replace ".{7}$"# 7.1.0-alpha.616.tar.gz



New-Item .\$name -ItemType Directory
cd $name
Invoke-WebRequest $myDownloadUrl -OutFile esignature.tar.gz #C:\Users\{username}
tar -xzvf esignature.tar.gz



#$req 
#Start-Process ".\esignatur Desktop Setup $name.exe" -WindowStyle Hidden
#cd ..



#write-host "esignature app has been downloaded and exe has been executed"