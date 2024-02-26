using namespace System.Management.Automation

Get-ChildItem "$Env:LOCALAPPDATA\bvkt\pwsh\*.ps1" | ForEach-Object {
    . $_.FullName
}
