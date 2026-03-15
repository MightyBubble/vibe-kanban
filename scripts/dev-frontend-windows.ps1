param(
  [string]$FrontendPort = '3002',
  [string]$BackendPort = '3003',
  [string]$PreviewProxyPort = '3004'
)

$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot

$env:FRONTEND_PORT = $FrontendPort
$env:BACKEND_PORT = $BackendPort
$env:PREVIEW_PROXY_PORT = $PreviewProxyPort
$env:VK_ALLOWED_ORIGINS = "http://localhost:$FrontendPort"
$env:VITE_OPEN = 'false'

Set-Location (Join-Path $repoRoot 'packages\local-web')

pnpm exec vite --port $FrontendPort
