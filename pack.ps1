#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$templateName = "SkyBlock";
$gameDirectory = "$env:LOCALAPPDATA\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang";
$behaviorPacktory = "$gameDirectory\development_behavior_packs";
$resourcePacktory = "$gameDirectory\development_resource_packs";
$temp = "$gameDirectory\$templateName";

# Delete temp directory (if exists)
Remove-Item "$temp" -Recurse -ErrorAction SilentlyContinue;
# Rename Template
Rename-Item -Path "$temp.mctemplate" -NewName "$templateName.zip";
# Unarchive Template
Expand-Archive -Path "$temp.zip" -DestinationPath "$temp";
# Remove Template Archive
Remove-Item "$temp.zip";
# Remove Old Behaviors
Remove-Item "$temp\behavior_packs\$templateName" -Recurse;
# Copy Behavior Pack to Template
Copy-Item -Path "$behaviorPacktory\$templateName" -Destination "$temp\behavior_packs\$templateName" -Recurse;
# Remove Old Resources
Remove-Item "$temp\resource_packs\$templateName" -Recurse;
# Copy Resource Pack to Template
Copy-Item -Path "$resourcePacktory\$templateName" -Destination "$temp\resource_packs\$templateName" -Recurse;

## 
# If I were to rezip(manually) it works
##

# Compress the Template
#Compress-Archive -Path "$temp" -DestinationPath "$temp.zip" -CompressionLevel NoCompression;
# Rename zip to mctemplate
#Rename-Item -Path "$temp.zip" -NewName "$temp.mctemplate";
# Delete temp directory
#Remove-Item "$temp" -Recurse;
