# Creates server.log (dummy) and counts lines containing "Error"

$count = (Select-String -Path "server.log" -Pattern "Error").Count
Write-Host "Lines containing 'Error': $count"