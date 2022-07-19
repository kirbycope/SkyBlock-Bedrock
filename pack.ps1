#Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

$templateName = "SkyBlock";
$gameDirectory = "$env:LOCALAPPDATA\Packages\Microsoft.MinecraftUWP_8wekyb3d8bbwe\LocalState\games\com.mojang";
$behaviorPacktory = "$gameDirectory\development_behavior_packs";
$resourcePacktory = "$gameDirectory\development_resource_packs";
$temp = "$gameDirectory\$templateName";

# Rename Template
Rename-Item -Path "$temp.mctemplate" -NewName "$templateName.zip";
# Unarchive Template
Expand-Archive -Path "$temp.zip" -DestinationPath "$temp";
# Remove Template Archvie
Remove-Item "$temp.zip" -Force -ErrorAction SilentlyContinue;
# Remove Old Behaviors
Remove-Item "$temp\behavior_packs\$templateName" -Recurse -ErrorAction SilentlyContinue;
# Copy Behavior Pack to Template
Copy-Item -Path "$behaviorPacktory\$templateName\" -Recurse -Destination "$temp\behavior_packs\$templateName" -Container;
# Remove Old Resources
Remove-Item "$temp\resource_packs\$templateName" -Force -ErrorAction SilentlyContinue;
# Copy Resource Pack to Template
Copy-Item -Path "$resourcePacktory\$templateName\" -Recurse -Destination "$temp\resource_packs\$templateName" -Container;
# Compress the Template
Compress-Archive -Path  "$temp\*" -DestinationPath "$temp.zip" -Force;
# Rename zip to mctemplate
Rename-Item -Path "$temp.zip" -NewName "$temp.mctemplate";
# Delete temp directory
Remove-Item "$temp" -Recurse -Force -ErrorAction SilentlyContinue;
