Import-Module posh-git
Import-Module PoShFuck
# Enable Prediction History
Set-PSReadLineOption -PredictionSource History
# Advanced Autocompletion for arrow keys
Set-PSReadlineKeyHandler -Key UpArrow   -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key "Tab"     -Function MenuComplete
Set-PSReadLineKeyHandler -Key "Ctrl+z"  -Function Undo

#zoxide
Set-Alias -Name cd  -Value __zoxide_z  -Option AllScope -Scope Global -Force
Set-Alias -Name cdi -Value __zoxide_zi -Option AllScope -Scope Global -Force

Invoke-Expression (& { $hook = if ($PSVersionTable.PSVersion.Major -ge 6) { 'pwd' } else { 'prompt' } (zoxide init powershell --hook $hook | Out-String) })

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

Remove-Alias -Name ls
function ls {
    param(
        [Switch] $path
    )
    g $args
}

function ll {
    g -1 -perm -size -owner -group -time 
}

function la {
    g -l
}

function weather {
    Invoke-RestMethod https://wttr.in
}

function source {
    & $profile
}


function OpenCurrentFolder {
	param
	(
		# 输入要打开的路径
		# 用法示例：open C:\
		# 默认路径：当前工作文件夹
		$Path = '.'
	)
	Invoke-Item $Path
}
Set-Alias -Name open -Value OpenCurrentFolder