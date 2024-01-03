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
