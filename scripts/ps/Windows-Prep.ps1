# Attribution
# https://gist.github.com/wallymathieu/9740382

Write-Host "Preparing windows ..."

# Step 1: Disable UAC
New-ItemProperty -Path HKLM:Software\Microsoft\Windows\CurrentVersion\Policies\System -Name EnableLUA -PropertyType DWord -Value 0 -Force | Out-Null
Write-Host "User Access Control (UAC) has been disabled." -ForegroundColor Green

# Step 2: Disable Automatic Updates
# Reference: http://www.benmorris.me/2012/05/1st-test-blog-post.html
$AutoUpdate = (New-Object -com "Microsoft.Update.AutoUpdate").Settings
$AutoUpdate.NotificationLevel = 1
$AutoUpdate.Save()
Write-Host "Windows Update has been disabled." -ForegroundColor Green

# Step 3: Disable Windows Firewall
&netsh "advfirewall" "set" "allprofiles" "state" "off"
Write-Host "Windows Firewall has been disabled." -ForegroundColor Green
