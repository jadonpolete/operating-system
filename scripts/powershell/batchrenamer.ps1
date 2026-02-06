# Adds OLD_ prefix to all .txt files in current directory

Get-ChildItem -Filter *.txt -File | ForEach-Object {
  if ($_.Name -notlike "OLD_*") {
    Rename-Item -LiteralPath $_.FullName -NewName ("OLD_" + $_.Name)
  }
}
Write-Host "Done renaming .txt files."
