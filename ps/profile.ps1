using namespace System.Management.Automation

function Get-WTActions { (Get-Content (Get-Item "$env:LOCALAPPDATA\Packages\Microsoft.WindowsTerminal_*\LocalState\settings.json") | ConvertFrom-Json).actions | Sort-Object -Property keys | format-Table -Property keys, command }

function Get-NetInfo {
    Get-NetAdapter | Where-Object {!($_.MacAddress -match '^00-.*')} | ForEach-Object {
        $x=$_
        Add-Member -InputObject $_ -MemberType ScriptProperty -Name NetIPAddresses -Value {Get-NetIPAddress | Where-Object { $_.InterfaceIndex -eq $x.InterfaceIndex }}
        $_
    }
}

oh-my-posh init pwsh --config "$env:LOCALAPPDATA/bvkt/eyesofbucket.omp.json" | Invoke-Expression

function Set-EnvVar {
    $x = (Get-Location -Stack).Path.count
    if($x -lt 1) {
        $Env:BVKT_DEPTH=''
        return
    }
    $Env:BVKT_DEPTH="$x"
}
New-Alias -Name 'Set-PoshContext' -Value 'Set-EnvVar' -Scope Global -Force

New-Alias which get-command
New-Alias wta get-wtactions

Set-PSReadLineOption -HistorySearchCursorMovesToEnd

### SSH autocompletion
Function Get-Hosts($configFile) {
    Get-Content $configFile `
    | Select-String -Pattern "^Host " `
    | ForEach-Object { $_ -replace "host ", "" } `
    | Sort-Object -Unique `
}

Register-ArgumentCompleter -CommandName ssh, scp, sftp -Native -ScriptBlock {
    param($wordToComplete, $commandAst, $cursorPosition)

    $sshDir = "${Env:HOMEPATH}\.ssh"

    $hosts = Get-Content "$sshDir\config" `
    | Select-String -Pattern "^Include " `
    | ForEach-Object { $_ -replace "include ", "" } `
    | ForEach-Object { Get-Hosts "$sshDir/$_" } `

    $hosts += Get-Hosts "$sshDir\config"
    $hosts = $hosts | Sort-Object -Unique

    # For now just assume it's a hostname.
    $textToComplete = $wordToComplete
    $generateCompletionText = {
        param($x)
        $x
    }
    if ($wordToComplete -match "^(?<user>[-\w/\\]+)@(?<host>[-.\w]+)$") {
        $textToComplete = $Matches["host"]
        $generateCompletionText = {
            param($hostname)
            $Matches["user"] + "@" + $hostname
        }
    }

    $hosts `
    | Where-Object { $_ -like "${textToComplete}*" } `
    | ForEach-Object { [CompletionResult]::new((&$generateCompletionText($_)), $_, [CompletionResultType]::ParameterValue, $_) }
}

# Shows navigable menu of all options when hitting Tab
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
