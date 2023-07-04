Import-Module posh-git
Import-Module PoShFuck
# Enable Prediction History
Set-PSReadLineOption -PredictionSource History
# Advanced Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow   -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
# Set-PSReadLineKeyHandler -Key "Tab"     -Function MenuComplete
Set-PSReadLineKeyHandler -Key "Ctrl+z"  -Function Undo

Invoke-Expression (& { $hook = if ($PSVersionTable.PSVersion.Major -ge 6) { 'pwd' } else { 'prompt' } (zoxide init powershell --cmd cd --hook $hook | Out-String) })

oh-my-posh.exe init pwsh --config 'C:\Users\Equationzhao\AppData\Local\Programs\oh-my-posh\themes\oh-my-posh-my-half-life-git\my-catppuccin.omp.json' | Invoke-Expression
#import gsudo PowerShell Module
Import-Module 'C:\Program Files\gsudo\Current\gsudoModule.psd1'
set-alias 'sudo' 'gsudo'

# alias for cd 
function .. { __zoxide_z .. }
function ... { __zoxide_z ../.. }
function .... { __zoxide_z ../../.. }
function ..... { __zoxide_z ../../../.. }


function New-BashStyleAlias([string]$name, [string]$command) {
    $sb = [scriptblock]::Create($command)
    New-Item "Function:\global:$name" -Value $sb | Out-Null
}

# alias for ni(touch)
function touch { New-Item $args -type file }

function SetGitProxy {
    git config --global https.proxy http://127.0.0.1:10809
    git config --global https.proxy https://127.0.0.1:10809
}

function UnsetGirProxy {
    git config --global --unset http.proxy
    git config --global --unset https.proxy
}

function dnsupdate {
    __zoxide_z C:\scripts\ddns
    GodDns.exe r a  -parallel
}

function hotspot {
    __zoxide_z C:\scripts\hotspot
    powershell  ./pondsihotspot.ps1
}

function lines {
    tokei
}

Remove-Alias -Name ps
function ps {
    procs
}

Set-Alias -Name top -Value btop

# g, a more powerfull ls
# https://github.com/Equationzhao/g
Invoke-Expression (& { (g --init powershell | Out-String) })

function weather {
    Invoke-RestMethod https://wttr.in
}

function source {
    & $profile
}


function OpenCurrentFolder {
	param
	(
		$Path = '.'
	)
	Invoke-Item $Path
}
Set-Alias -Name open -Value OpenCurrentFolder

function goi {
    go install $args
}
