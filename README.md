��# azgoods

# How to run
1. Clone to a folder
2. Run Powershell as Administrator and add folder path to PS modules path :

```powershell
    $CurrentValue = [Environment]::GetEnvironmentVariable("PSModulePath", "Machine")
    [Environment]::SetEnvironmentVariable("PSModulePath", $CurrentValue + [System.IO.Path]::PathSeparator + "C:\Program Files\Fabrikam\Modules", "Machine")
```
    
3. 
