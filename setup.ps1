# PowerShell script to setup Inner-Light project for development

# Ensure to run this script as Administrator

# Check for Chocolatey (package manager for Windows) and install if not found
if (-not (Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Installing Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force;
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Install necessary dependencies
$dependencies = @(
    'git',         # Version control system
    'nodejs',     # JavaScript runtime
    'npm',        # Package manager for JavaScript
    'python',     # Python programming language
    'visualstudio2022community' # Visual Studio
)

foreach ($dep in $dependencies) {
    Write-Host "Installing $dep..."
    choco install $dep -y
}

Write-Host "All dependencies have been installed successfully!"

# Setup project directory
$projectDir = "C:\path\to\your\Inner-Light"
if (-not (Test-Path $projectDir)) {
    New-Item -ItemType Directory -Path $projectDir
}

# Clone the repository if it isn't already
Set-Location -Path $projectDir
if (-not (Test-Path "Inner-Light")) {
    git clone https://github.com/YourUsername/Inner-Light.git
}

Set-Location -Path "Inner-Light"

# Install Node.js dependencies
npm install

Write-Host "Inner-Light project setup completed!"