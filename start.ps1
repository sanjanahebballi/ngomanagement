# Build and start script for both frontend and backend
$ErrorActionPreference = "Stop"

Write-Host "🚀 Starting Healthcare NGO Management System..." -ForegroundColor Green

# Create jobs array to store background processes
$jobs = @()

# Start MongoDB (if installed locally)
Write-Host "📦 Starting MongoDB..." -ForegroundColor Cyan
try {
    Start-Service MongoDB
} catch {
    Write-Host "⚠️ MongoDB service not found. Make sure MongoDB is installed and running." -ForegroundColor Yellow
}

# Build and start backend
Write-Host "📦 Building backend..." -ForegroundColor Cyan
Set-Location server
npm run build
if ($LASTEXITCODE -ne 0) {
    Write-Host "❌ Backend build failed" -ForegroundColor Red
    exit $LASTEXITCODE
}

# Start backend in background
$backendJob = Start-Job -ScriptBlock {
    Set-Location $using:PWD
    npm run dev
}
$jobs += $backendJob

# Start frontend in background
Write-Host "📦 Starting frontend..." -ForegroundColor Cyan
Set-Location ../client
$frontendJob = Start-Job -ScriptBlock {
    Set-Location $using:PWD
    npm start
}
$jobs += $frontendJob

Write-Host "✅ Development environment started successfully!" -ForegroundColor Green
Write-Host "📱 Frontend: http://localhost:3000" -ForegroundColor Cyan
Write-Host "🖥️ Backend: http://localhost:5000" -ForegroundColor Cyan
Write-Host "Press Ctrl+C to stop all processes" -ForegroundColor Yellow

# Wait for any job to complete and show output
try {
    while ($true) {
        $jobs | ForEach-Object {
            Receive-Job -Job $_ -ErrorAction SilentlyContinue
        }
        Start-Sleep -Seconds 1
    }
} finally {
    # Clean up on exit
    $jobs | ForEach-Object {
        Stop-Job -Job $_
        Remove-Job -Job $_
    }
    Write-Host "`n👋 Shutting down development environment..." -ForegroundColor Yellow
}
