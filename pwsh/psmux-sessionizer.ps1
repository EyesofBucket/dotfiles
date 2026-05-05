Function Invoke-PSMuxSession {
    param (
        [Parameter(Mandatory=$False)][String] $Location
    )

    if ($Location) {
        $Location = $(Get-Item $Location)
    } else {
        $LocationOptions = $($BVKT_PROJECT_DIRS | ForEach-Object { Get-ChildItem -Directory $_ }).FullName + $BVKT_PROJECTS
        if (! $LocationOptions) { Write-Error "No location options found!"; return }

        $Location = $($LocationOptions | fzf --preview "eza --icons --git -gTlaI -git --color=always {}")
        if (! $Location) { Write-Error "No location selected!"; return }
    }

    $LocationItem = $(Get-Item $Location)
    $Project = @{
        Name = $LocationItem.Name -replace '\.', '_'
        Path = $LocationItem.FullName
    }
    if (! $(tmux has-session -t $Project.Name $$ $True || $False)) {
        [Environment]::SetEnvironmentVariable('PSMUX_SESSION', [NullString]::Value)
        tmux new-session -d -s $Project.Name -c $Project.Path
        tmux new-window -t $Project.Name -c $Project.Path -n 'neovim' 'nvim .; pwsh'
    }

    if ($null -eq $Env:TMUX) {
        $AttachCommand = 'attach-session'
    } else {
        $AttachCommand = 'switch-client'
    }

    tmux $AttachCommand -t $Project.Name
}

Set-Alias -Name "tmux-sessionizer" -Value "Invoke-PSMuxSession"
Set-Alias -Name "psmux-sessionizer" -Value "Invoke-PSMuxSession"

Set-PSReadLineKeyHandler -Chord 'Ctrl+f' -ScriptBlock {
    [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
    [Microsoft.PowerShell.PSConsoleReadLine]::Insert("Invoke-PSMuxSession")
    [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
}

$BVKT_PROJECTS = "$Env:LOCALAPPDATA\bvkt"
$BVKT_PROJECT_DIRS = "$Env:USERPROFILE\projects","$Env:USERPROFILE\Documents\PowerShell\Modules"
