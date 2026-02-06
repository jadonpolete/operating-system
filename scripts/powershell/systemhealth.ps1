# Outputs: Date/Time, Hostname, Current User, Disk usage for C:

Write-Host "=== System Health Snapshot ==="
Write-Host ("Date/Time:  {0}" -f (Get-Date))
Write-Host ("Hostname:   {0}" -f $env:COMPUTERNAME)
Write-Host ("User:       {0}" -f $env:USERNAME)

$drive = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$freeGB  = [math]::Round($drive.FreeSpace / 1GB, 2)
$totalGB = [math]::Round($drive.Size / 1GB, 2)
Write-Host ("Disk (C:):  Free {0} GB / Total {1} GB" -f $freeGB, $totalGB)
