# my-vimrc
just some vimrc stuff for downloading to some target system

##About languages:
* **C#** even with Unity work properly at 29.11.2025
  * Dependences: ale, fzf, sharpenup, that is reccomended for omnisharp-vim at their official site.
  * You must use VS Code extension in Unity and do a single switch to vscode in external ide option (in preferences) everytime you want to generate .csproj files
  * You must write slnx_to_sln script, because omnisharp can not understand .slnx solution files.
  * You must have appropriate version of MSBuild (and may be Mono, I haven't checked this).
  * Tip: do NOT generate all the .csproj files, it cause increasing of omnisharp server load time (Embedded and local packages are enougth) 

### Recommended setup for Win
* **AutoHotkeyDash** with caps_lang_switch.ahk script (_you can put the shortcut to shell:startup to let the script be able to autoload after system reboot_)
* **Windows Terminal**, which is **NOT** downloaded to WindowsApps
* **PowerShell 7** as WindowsTerminal shell

### Recommended setup for Ubuntu
* Ubuntu is fine, but there is also **PowerShell 7**
