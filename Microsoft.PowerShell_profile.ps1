C:\Users\Equationzhao\AppData\Local\Programs\oh-my-posh\bin\oh-my-posh.exe init pwsh --config 'C:\Users\Equationzhao\AppData\Local\Programs\oh-my-posh\themes\half-life.omp.json' | Invoke-Expression


#import gsudo PowerShell Module
Import-Module 'C:\Program Files (x86)\gsudo\gsudoModule.psd1'
set-alias 'sudo' 'gsudo'

# alias for cd 
function .. { cd .. }
function ... { cd ../.. }
function .... { cd ../../.. }
function ..... { cd ../../../.. }


function l {ls }



# alias for ni(touch)
function touch { ni $args -type file }

function createFolderTheSameNameAsFile {
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [System.IO.File]$file
    )
    $folder = (get-item $file ).Directory.FullName + "\\" + (get-item $file ).BaseName

    # if the folder doesn't exist, create it
    if (!(Test-Path $folder)) {
        mkdir $folder
    }
    
}

function SetGitProxy{
	git config --global https.proxy http://127.0.0.1:10809
	git config --global https.proxy https://127.0.0.1:10809
}

function UnsetGirProxy{
	git config --global --unset http.proxy
	git config --global --unset https.proxy
}

function dnsupdate{
	cd C:\scripts\ddns
	./GodDns.exe r a o -parallel
}

function hotspot{
	cd C:\scripts\hotspot
	powershell  ./pondsihotspot.ps1
}
