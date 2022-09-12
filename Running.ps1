$myURI = "http://20.56.57.104:5080"



$req = (Invoke-WebRequest -URI $myURI -UseBasicParsing).Content.Split([Environment]::NewLine) | sls 'alpha' | sls -Pattern 'mac' -NotMatch | Select -Last 1
$req =  $req | Out-String



$req = $req.Split(">")[2].Split("<")[0].Trim()




$name=$req -replace ".{7}$"# 7.1.0-alpha.616.tar.gz


cd $name 
Start-Process ".\esignatur Desktop $name.msi"
cd ..
#write-host "esignature app has been downloaded and exe has been executed"