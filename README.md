# azgoods

An Azure Active Directory module gathering useful scripts.

## How to run
1. Clone to a folder
2. Run Powershell **as Administrator** and go to folder location:

```powershell
Set-Location <Module path>
```

3. Add folder path to PS modules path
```powershell
$CurrentValue = [Environment]::GetEnvironmentVariable("PSModulePath", "Machine")
[Environment]::SetEnvironmentVariable("PSModulePath", $CurrentValue + [System.IO.Path]::PathSeparator + "C:\Program Files\Fabrikam\Modules", "Machine")
```
4. Import Powershell Module (As Administrator):
```powershell
    $CurrentValue = [Environment]::GetEnvironmentVariable("PSModulePath", "Machine")
    [Environment]::SetEnvironmentVariable("PSModulePath", $CurrentValue + [System.IO.Path]::PathSeparator + "C:\Program Files\Fabrikam\Modules", "Machine")
```

## Cmdlets list

- AAD Syncronization commands
    - *Sync-UserDomain* Syncronize user domains (that not linked AAD) to passed domain if verified in tenant.
