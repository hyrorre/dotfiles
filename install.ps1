[CmdletBinding(SupportsShouldProcess = $true)]
param(
    [string]$DotDir = (Join-Path $HOME "dotfiles"),
    [string]$HomeDir = $HOME,
    [switch]$NoClone,
    [switch]$Copy
)

$ErrorActionPreference = "Stop"

function Ensure-Command {
    param([string]$Name)

    if (-not (Get-Command $Name -ErrorAction SilentlyContinue)) {
        throw "Required command not found: $Name"
    }
}

function Ensure-Directory {
    param([string]$Path)

    if (-not (Test-Path -LiteralPath $Path)) {
        if ($PSCmdlet.ShouldProcess($Path, "Create directory")) {
            New-Item -ItemType Directory -Path $Path | Out-Null
        }
    }
}

function Remove-ExistingLink {
    param([string]$Path)

    $item = Get-Item -LiteralPath $Path -Force -ErrorAction SilentlyContinue
    if ($null -eq $item) {
        return $true
    }

    $isReparsePoint = ($item.Attributes -band [IO.FileAttributes]::ReparsePoint) -ne 0
    if ($isReparsePoint) {
        if ($PSCmdlet.ShouldProcess($Path, "Remove existing link")) {
            Remove-Item -LiteralPath $Path -Force
        }
        return $true
    }

    return $false
}

function Backup-ExistingItem {
    param([string]$Path)

    $timestamp = Get-Date -Format "yyyyMMddHHmmss"
    $backupPath = "$Path.backup.$timestamp"

    if ($PSCmdlet.ShouldProcess($Path, "Move to $backupPath")) {
        Move-Item -LiteralPath $Path -Destination $backupPath
    }
}

function Install-File {
    param(
        [string]$Source,
        [string]$Target
    )

    if (-not (Test-Path -LiteralPath $Source)) {
        Write-Warning "Missing source: $Source"
        return
    }

    $targetParent = Split-Path -Parent $Target
    Ensure-Directory $targetParent

    if (Test-Path -LiteralPath $Target) {
        if (-not (Remove-ExistingLink $Target)) {
            Backup-ExistingItem $Target
        }
    }

    if ($Copy) {
        if ($PSCmdlet.ShouldProcess($Target, "Copy from $Source")) {
            Copy-Item -LiteralPath $Source -Destination $Target -Force
        }
    } else {
        if ($PSCmdlet.ShouldProcess($Target, "Create symbolic link to $Source")) {
            New-Item -ItemType SymbolicLink -Path $Target -Target $Source | Out-Null
        }
    }
}

if (-not $NoClone -and -not (Test-Path -LiteralPath $DotDir)) {
    Ensure-Command "git"
    if ($PSCmdlet.ShouldProcess($DotDir, "Clone dotfiles repository")) {
        git -c core.autocrlf=false clone https://github.com/hyrorre/dotfiles.git $DotDir
        git -C $DotDir config core.autocrlf false
    }
}

if (-not (Test-Path -LiteralPath $DotDir)) {
    throw "Dotfiles directory not found: $DotDir"
}

$configDir = Join-Path $HomeDir ".config"
$sshDir = Join-Path $HomeDir ".ssh"

Ensure-Directory (Join-Path $configDir "git")
Ensure-Directory (Join-Path $configDir "micro")
Ensure-Directory (Join-Path $configDir "mise")
Ensure-Directory $sshDir

$links = @(
    @(".config\git\ignore", ".config\git\ignore"),
    @(".config\micro\bindings.json", ".config\micro\bindings.json"),
    @(".config\micro\settings.json", ".config\micro\settings.json"),
    @(".config\mise\config.toml", ".config\mise\config.toml"),
    @(".ssh\config", ".ssh\config"),
    @(".gitconfig", ".gitconfig"),
    @(".gitconfig_private", ".gitconfig_private"),
    @(".gitconfig_work", ".gitconfig_work"),
    @(".zshrc", ".zshrc"),
    @(".zprofile", ".zprofile")
)

foreach ($link in $links) {
    $source = Join-Path $DotDir $link[0]
    $target = Join-Path $HomeDir $link[1]
    Install-File -Source $source -Target $target
}

Write-Host "Done."
