$myURI = "http://20.56.57.104:5080"



$req = (Invoke-WebRequest -URI $myURI -UseBasicParsing).Content.Split([Environment]::NewLine) | sls 'alpha' | sls -Pattern 'mac' -NotMatch | Select -Last 1
$req =  $req | Out-String



$req = $req.Split(">")[2].Split("<")[0].Trim()



$myDownloadUrl = "$myURI/$req"




$name=$req -replace ".{7}$"# 7.1.0-alpha.616.tar.gz



New-Item .\$name -ItemType Directory
cd $name
Invoke-WebRequest $myDownloadUrl -OutFile esignature.tar.gz #C:\Users\{username}
tar -xvf esignature.tar.gz
