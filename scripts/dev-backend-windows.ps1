param(
  [string]$FrontendPort = '3002',
  [string]$BackendPort = '3003',
  [string]$PreviewProxyPort = '3004'
)

$ErrorActionPreference = 'Stop'

$repoRoot = Split-Path -Parent $PSScriptRoot
$vsDevCmd = 'C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\Tools\VsDevCmd.bat'

# Import the MSVC toolchain environment so bindgen can find the Windows headers.
cmd.exe /d /c "call `"$vsDevCmd`" -arch=x64 -host_arch=x64 >nul && set" |
  ForEach-Object {
    if ($_ -match '^(.*?)=(.*)$') {
      [System.Environment]::SetEnvironmentVariable($matches[1], $matches[2], 'Process')
    }
  }

$env:LIBCLANG_PATH = 'C:\Program Files\LLVM\bin'
$env:PATH = 'C:\Program Files\LLVM\bin;' + $env:PATH
$env:FRONTEND_PORT = $FrontendPort
$env:BACKEND_PORT = $BackendPort
$env:PREVIEW_PROXY_PORT = $PreviewProxyPort
$env:VK_ALLOWED_ORIGINS = "http://localhost:$FrontendPort"
$env:DISABLE_WORKTREE_CLEANUP = '1'
$env:RUST_LOG = 'debug'

Set-Location $repoRoot

cargo watch -w crates -x 'run --bin server'
