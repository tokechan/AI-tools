# Codex CLI Configuration Setup Script (Windows PowerShell)
# This script copies AGENTS.md to the Codex CLI configuration directory

$ErrorActionPreference = "Stop"

$CODEX_DIR = Join-Path $env:USERPROFILE ".codex"
$SCRIPT_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path

Write-Host "🚀 Codex CLI Configuration Setup" -ForegroundColor Cyan
Write-Host "==================================" -ForegroundColor Cyan
Write-Host ""

# Check if .codex directory exists
if (-not (Test-Path $CODEX_DIR)) {
    Write-Host "⚠️  Warning: $CODEX_DIR does not exist." -ForegroundColor Yellow
    Write-Host "   Creating directory..." -ForegroundColor Yellow
    New-Item -ItemType Directory -Path $CODEX_DIR -Force | Out-Null
}

# Copy AGENTS.md
$SOURCE_FILE = Join-Path $SCRIPT_DIR "AGENTS.md"
if (Test-Path $SOURCE_FILE) {
    Write-Host "📝 Copying AGENTS.md to $CODEX_DIR\" -ForegroundColor Green
    Copy-Item $SOURCE_FILE -Destination (Join-Path $CODEX_DIR "AGENTS.md") -Force
    Write-Host "✅ AGENTS.md has been installed successfully!" -ForegroundColor Green
} else {
    Write-Host "❌ Error: AGENTS.md not found in $SCRIPT_DIR" -ForegroundColor Red
    exit 1
}

Write-Host ""
Write-Host "🎉 Setup complete!" -ForegroundColor Cyan
Write-Host ""
Write-Host "Next steps:" -ForegroundColor White
Write-Host "  - Verify the configuration: Get-Content $CODEX_DIR\AGENTS.md" -ForegroundColor White
Write-Host "  - Start using Codex CLI with your global rules" -ForegroundColor White
Write-Host ""

