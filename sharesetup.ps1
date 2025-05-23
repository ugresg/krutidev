# PowerShell Script to Share D: Drive
# Run as Administrator

# 1. D: drive ko share karo "DShare" naam se
New-SmbShare -Name "DShare" -Path "D:\" -FullAccess "Everyone"

# 2. Enable Network Discovery & File and Printer Sharing
Set-NetFirewallRule -DisplayGroup "Network Discovery" -Enabled True
Set-NetFirewallRule -DisplayGroup "File and Printer Sharing" -Enabled True

# 3. Disable Password Protected Sharing
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Lsa" -Name "LimitBlankPasswordUse" -Value 0

Write-Host "✅ D: drive shared successfully at \\$(hostname)\DShare"
