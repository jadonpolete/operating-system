param(
  [Parameter(Mandatory=$true)]
  [string]$File
)

$limit = 1048576

if (-not (Test-Path -LiteralPath $File)) {
  Write-Host "Error: File does not exist: $File"
  exit 1
}

$size = (Get-Item -LiteralPath $File).Length
if ($size -gt $limit) {
  Write-Host "Warning: File is too large ($size bytes)"
} else {
  Write-Host "File size is within limits ($size bytes)"
}
