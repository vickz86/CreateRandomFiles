#Check if the file that need to be copied exist, CHANGE IT HERE!!
$pathToFile = "C:\Users\victor\E_work\B_code\Z_Template\templateFile.txt"
if ( -not (Test-Path -Path $pathToFile)){
    Write-Host "the file to get text dont exist , Edit path in the script!"
    exit
}
#Get content of the file
$contentFile = Get-Content -Path $pathToFile


#ask the number of file you are going to create
[int]$nbFile = Read-Host "type number of file you want to create"

#ask the number of folder you want to create
[int]$nbDir = Read-Host "type number of Directory you want to create, 0 will create file in current directory"



#if directory is equal to 0
if($nbDir -eq 0){
    For ($i = 0;$i -lt $nbFile;$i++){
        #create the file
        $fileName = "templateFile"+$i.ToString()+".txt"
        $newFile = New-Item -Path . -Name $fileName
        Add-Content -Path $newFile -Value $contentFile
    }
    Write-Host "files created"
}



#if directory is not equal to 0
if($nbDir -ne 0){
    For ($i = 0;$i -lt $nbDir;$i++){
        $direName = "templateDir"+$i.ToString()
        $newDire = New-Item -Path . -Name $direName -ItemType Directory
        For ($a = 0;$a -lt $nbFile;$a++){
            #create the file
            $fileName = "templateFile"+$a.ToString()+".txt"
            $newFile = New-Item -Path $newDire.FullName -Name $fileName
            Add-Content -Path $newFile -Value $contentFile
        }
    }
    Write-Host "Folders created"
}