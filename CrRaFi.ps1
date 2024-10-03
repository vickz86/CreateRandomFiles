#Check if the file that need to be copied exist, CHANGE IT HERE!!
$pathToFile = "C:\Users\victor\E_work\B_code\Z_Template\templateFile.txt"
if ( -not (Test-Path -Path $pathToFile)){
    Write-Host "the file to get text dont exist , Edit path in the script!"
    exit
}

#ask the number of file you are going to create
[int]$nbFile = Read-Host "type number of file you want to create"


For ($i = 0;$i -lt $nbFile;$i++){
    #create the file
    $fileName = "templateFile"+$i.ToString()+".txt"
    $fileName
}