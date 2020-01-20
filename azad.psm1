<#
 .Synopsis
  Manages AAD module.

 .Description
  PS Functions to run AAD procedures easly and quickly, currently based on demands of others.

 .Parameter Init
  Init param

 .Example
   # Show a default display of this month.
   Show-Module
#>
function Show-Module {
    Param (
        $init = "initiate module"
    )
    write-host $init
}
Export-ModuleMember -Function Show-Module