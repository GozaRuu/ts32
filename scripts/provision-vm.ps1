function Install-Chocolatey {
  Invoke-WebRequest -useb https://chocolatey.org/install.ps1 | Invoke-Expression
}

function Install-Choco-Packages {
  choco install --no-progress --limit-output --yes vim vscode GoogleChrome autohotkey openssh
  choco install --no-progress --limit-output --yes nodejs yarn
  choco install --no-progress --limit-output --yes python3
}

function Trusty-Path-Reload {
  # reload Path workded better than dot sourcing
  $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
}

# function Install-Python-Packages {
#   # this needs elevated shell, better do it from here.
#   python -m pip install --upgrade pip
#   pip install pywin32
# }

Install-Chocolatey
Trusty-Path-Reload
Install-Choco-Packages
# Trusty-Path-Reload
# Install-Python-Packages
