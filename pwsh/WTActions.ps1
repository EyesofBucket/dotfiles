function Get-WTActions {
    $WTFiles = @(
        "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_*\LocalState\settings.json"
        "$HOME\scoop\persist\windows-terminal\settings\settings.json"
    )

    foreach($i in $WTFiles) {
        if([System.IO.File]::Exists($i)) {
            $WTFile = $i; break
        }
    }

    if(!$WTFile) { return }

    $WTActions = (Get-Content $WTFile | ConvertFrom-Json).actions
    $WTActions | Sort-Object -Property keys | format-Table -Property keys, command
}
