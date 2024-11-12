@echo off
echo Running system cleanup and maintenance tasks...

cleanmgr /sageset:1
cleanmgr /sagerun:1
del /q /s /f %temp%*
del /q /s /f C:\Windows\Temp*
sfc /scannow
dism /online /cleanup-image /restorehealth
start taskmgr
wmic product get name
defrag C: /O
echo Y | chkdsk C: /f /r
powercfg -h off
net stop wuauserv
del /q /s /f C:\Windows\SoftwareDistribution\Download*
net start wuauserv
cleanmgr /d C: /tuneup:1
ipconfig /flushdns
tasklist
taskkill /im processname.exe /f
Get-ChildItem -Path C:\ -Recurse -File | Sort-Object Length -Descending | Select-Object FullName, Length -First 10
start services.msc