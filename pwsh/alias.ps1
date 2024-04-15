New-Alias which get-command
New-Alias wta get-wtactions

$Env:bvktpath = Join-Path $Env:LOCALAPPDATA "bvkt"
function bvktedit {
    Push-Location $Env:bvktpath
    nvim .
    Pop-Location
}

function bvktconf {
    Push-Location $Env:bvktpath
}

$Env:nvpath = Join-Path $Env:LOCALAPPDATA "nvim"
function nvedit {
    Push-Location $Env:nvpath
    nvim .
    Pop-Location
}

function nvconf {
    Push-Location $Env:nvpath
}
