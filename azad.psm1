<#
 .Synopsis
  Sync user domain purffix for who wasn't synced from AAD connect

 .Description
  PS Functions to run AAD procedures easly and quickly, currently based on demands of others.

 .Parameter Init
  Init param

 .Example
   # Show a default display of this month.
   Show-Module
#>
function Sync-domain {
    [Parameter(Mandatory = $true)]
    [ValidateScript({if ($domain_name -notlike "@*") {$domain_name = "@" + $domain_name}})]
    [String]$domain_name

    # Check if connected to MSOL.
    $domains = Get-MsolDomain -ErrorAction SilentlyContinue
    if(-not $?) {
        Connect-MsolService
        $domains = Get-MsolDomain -ErrorAction SilentlyContinue
    } else {
        $current_domain = $domains | Where-Object {$_.name -eq $domain_name.Substring(1,$domain_name.Length-1)
            if ($current_domain.status -eq 'Verified') {
                $azureADUsers = Get-MsolUser -all | Where-Object {(-not $_.LastDirSyncTime) -and ($_.UserPrincipalName -notlike "*@idf.il") }
                $azureADUsers | ForEach-Object {

                    $newUPN = ($_.UserPrincipalName.split("@"))[0] + "@idf.il"
                
                  
                    if(Get-MsolUser -SearchString $newUPN){
                        Write-Host "[-]"  $newUPN ": Username already exists" -BackgroundColor Red
                    }else{ 
                         
                        Write-Host "[+]"  $newUPN -BackgroundColor Green
                
                        Set-MsolUserPrincipalName  -ObjectId $_.ObjectId -NewUserPrincipalName $newUPN 
                    }
                }
            } else {
                Write-Host "Domain $($domain_name) is not verified" -ForegroundColor Red
            }
        }   
    }
}
Export-ModuleMember -Function sync-domain