# deploy.ps1 — JonahOskow.com Netlify deployment
# Site: jo-site-jonah.netlify.app

$siteId  = "9b7a0a93-101e-4e19-8bea-02d6e2b502b4"
$dir     = "C:\Users\josko\Documents\JONAHOSKOW\jo-site"
$envFile = "C:\Users\josko\Documents\HACLAUDE\ha-site\.env"

# Load token
$envVars = @{}
Get-Content $envFile | ForEach-Object {
    if ($_ -match '^(\w+)=(.+)$') { $envVars[$Matches[1]] = $Matches[2] }
}
$token = $envVars['NETLIFY_TOKEN']

Write-Host "Collecting files..."
$allFiles = @(
    Get-ChildItem $dir -Filter '*.html'
    Get-ChildItem $dir -Filter '*.svg'
    Get-ChildItem $dir -Filter '*.ico'
    Get-ChildItem $dir -Filter '*.css'
    Get-ChildItem $dir -Filter '*.js'
)

# Build three maps: path->hash, hash->path, path->localpath
$pathToHash  = @{}
$hashToPath  = @{}
$pathToLocal = @{}

foreach ($f in $allFiles) {
    $hash = (Get-FileHash $f.FullName -Algorithm SHA1).Hash.ToLower()
    $key  = "/$($f.Name)"
    $pathToHash[$key]  = $hash
    $hashToPath[$hash] = $key
    $pathToLocal[$key] = $f.FullName
}
Write-Host "Found $($allFiles.Count) files"

# Determine MIME type
function Get-ContentType($path) {
    switch ([System.IO.Path]::GetExtension($path)) {
        '.html' { 'text/html; charset=utf-8' }
        '.svg'  { 'image/svg+xml' }
        '.ico'  { 'image/x-icon' }
        '.css'  { 'text/css' }
        '.js'   { 'application/javascript' }
        default { 'application/octet-stream' }
    }
}

# Create deploy (files map: path -> sha1)
Write-Host "Creating deploy..."
$body = @{ files = $pathToHash; draft = $false } | ConvertTo-Json -Depth 5
$deploy = Invoke-RestMethod `
    "https://api.netlify.com/api/v1/sites/$siteId/deploys" `
    -Method POST `
    -Headers @{ Authorization = "Bearer $token"; "Content-Type" = "application/json" } `
    -Body $body

$deployId = $deploy.id
Write-Host "Deploy ID: $deployId"
Write-Host "Required uploads: $($deploy.required.Count)"

# Upload each required file (required contains SHA1 hashes)
foreach ($sha in $deploy.required) {
    $sitePath  = $hashToPath[$sha]
    if (-not $sitePath) { Write-Host "SKIP (unknown hash): $sha"; continue }
    $localPath = $pathToLocal[$sitePath]
    $ct        = Get-ContentType $sitePath
    $bytes     = [System.IO.File]::ReadAllBytes($localPath)
    Write-Host "Uploading $sitePath ($($bytes.Length) bytes)"
    try {
        Invoke-RestMethod `
            "https://api.netlify.com/api/v1/deploys/$deployId/files$sitePath" `
            -Method PUT `
            -Headers @{ Authorization = "Bearer $token"; "Content-Type" = $ct } `
            -Body $bytes | Out-Null
    } catch {
        Write-Host "  ERROR: $_"
    }
}

# Poll until ready
Write-Host "Waiting for deploy..."
$maxWait = 90; $elapsed = 0
do {
    Start-Sleep 3; $elapsed += 3
    $status = Invoke-RestMethod `
        "https://api.netlify.com/api/v1/deploys/$deployId" `
        -Headers @{ Authorization = "Bearer $token" }
    Write-Host "  State: $($status.state)"
} while ($status.state -notin @('ready','error') -and $elapsed -lt $maxWait)

if ($status.state -eq 'ready') {
    Write-Host ""
    Write-Host "LIVE: https://jo-site-jonah.netlify.app" -ForegroundColor Green
    Write-Host "Admin: https://app.netlify.com/projects/jo-site-jonah" -ForegroundColor Cyan
} else {
    Write-Host "State: $($status.state)" -ForegroundColor Yellow
}
