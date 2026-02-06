# Lists top 5 processes by memory usage
# Outputs Process Name, PID, Memory Usage

Get-Process |
  Sort-Object -Property WorkingSet -Descending |
  Select-Object -First 5 @{Name="ProcessName";Expression={$_.ProcessName}},
                   @{Name="PID";Expression={$_.Id}},
                   @{Name="MemoryMB";Expression={[math]::Round($_.WorkingSet/1MB,2)}}
