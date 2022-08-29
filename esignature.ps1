$res= Invoke-WebRequest http://20.56.57.104:5080/



$lastAlphaGzip= $res.Links | Where {$_.href -like "*alpha*"} | select $_.href -Last 1



$srcFile = "http://20.56.57.104:5080/{0}" -f $lastAlphaGzip.href

$fullname=$srcFile.Trim(".tar.gz")
$name=$Fullname.replace("http://20.56.57.104:5080/","")

#Note: define your path, where you want to extract

$destination = "d:\downloads\{0}" -f $lastAlphaGzip.href

 

Invoke-WebRequest -Uri $srcFile  -OutFile $destination


#Note: Specify your own exe/msi which you want to run.

#Get-ChildItem -Path "d:\downloads\esignature" -Filter "esignatur Desktop Setup $name.exe" |

#Foreach-Object {

    #Write-Output $_.FullName

    #Start-Process $_.FullName}

