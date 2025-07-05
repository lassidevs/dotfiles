# dotfiles/install/install-windows.ps1

$DOTFILES = "$HOME\dotfiles"

Write-Host "🔗 Linking Windows configs..."

# Correct path for GlazeWM
$GlazeTarget = "$HOME\.glzr\glazewm"
$GlazeSource = "$DOTFILES\windows\glazewm"

# Create symlink
New-Item -ItemType SymbolicLink -Path $GlazeTarget -Target $GlazeSource -Force

Write-Host "GlazeWM config linked to $GlazeSource"
Write-Host "✅ Windows symlinkings complete $GlazeSource"
