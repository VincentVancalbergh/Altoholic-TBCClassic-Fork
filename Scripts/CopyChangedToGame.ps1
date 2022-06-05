$wowInterfaceFolder = "C:\Games\World of Warcraft\_classic_\Interface\AddOns"
$sourceFolder = "..\Source"
$Folders = Get-ChildItem -Path $sourceFolder -Directory
foreach ($Folder in $Folders) {
    $sourceFolderFullName = $Folder.FullName
    $destinationFolderFullName = "$($wowInterfaceFolder)\$($Folder.Name)"
    if ((Test-Path -Path $destinationFolderFullName -PathType Container) -eq $false)
    {
        New-Item -Path $destinationFolderFullName -ItemType Directory
    }
    Copy-Item -Path "$($sourceFolderFullName)\*" -Destination $destinationFolderFullName -Recurse -Force
}