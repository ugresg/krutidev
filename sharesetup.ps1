# Run this as Administrator!

# 1. Folder create karo
$folderPath = "C:\Share"
New-Item -Path $folderPath -ItemType Directory -Force

# 2. Folder ko share karo "Everyone" ke saath
New-SmbShare -Name "Share" -Path $folderPath -FullAccess "Everyone"

# 3. File sharing settings enable karo
Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True

# 4. Network discovery enable karo
Set-NetFirewallRule -DisplayGroup "Network Discovery" -Enabled True

# 5. Password protected sharing OFF karo
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LimitBlankPasswordUse" -Value 0

Write-Host "Setup complete! Folder shared at \\$(hostname)\Share"
