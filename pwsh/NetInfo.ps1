function Get-NetInfo {
    Get-NetAdapter | Where-Object {!($_.MacAddress -match '^00-.*')} | ForEach-Object {
        $x=$_
        Add-Member -InputObject $_ -MemberType ScriptProperty -Name NetIPAddresses -Value {
            Get-NetIPAddress | Where-Object {
                $_.InterfaceIndex -eq $x.InterfaceIndex
            }
        }
        $_
    }
}
