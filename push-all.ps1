$ErrorActionPreference = 'Continue'
if ($PSScriptRoot) { Set-Location $PSScriptRoot }
if (-not (Test-Path .git)) { git init }
if (-not (git config user.name))  { git config --global user.name "Mercy Mbaka" }
if (-not (git config user.email)) { git config --global user.email "official.mercymbaka@gmail.com" }
git add -A
git diff --cached --quiet
if ($LASTEXITCODE -ne 0) { git commit -m "Toys R Us storefront: mockup-matched frontend, images, build script" }
git branch -M main
if (git remote) { git remote set-url origin https://github.com/Mbaka-cmd/toysrus.git } else { git remote add origin https://github.com/Mbaka-cmd/toysrus.git }
git push -u origin main
if ($LASTEXITCODE -eq 0) { Write-Host "Pushed -> https://github.com/Mbaka-cmd/toysrus" } else { Write-Host "Push failed - read the message above" }
