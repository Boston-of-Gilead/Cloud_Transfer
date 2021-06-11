#Moves users out of on-prem and exclusively to tenant

$list = Import-CSV -Path "C:\path_to\cloudlist.csv"

#Invoke-Command -ComputerName yyyazcap1pw -Credential <cred> -ScriptBlock {
#	Import-Module ADSync
#	Start-ADSyncSyncCycle -PolicyType Delta
#    }

#For ($i=120; $i -ge 0; $i–-) {  
#    Write-Progress -Activity "120s wait. Can I offer you a nice egg in this trying time?" -SecondsRemaining $i
#    Start-Sleep 1
#}

connect-msolservice

#Get-content -path $list
$list = Get-Content -Path "C:\path_to\cloudlist.txt"

forEach ($i in $list){

Restore-MsolUser -UserPrincipalName $i

Set-MsolUser -UserPrincipalName $i -ImmutableId "$null"

#Set-MsolUserPassword -UserPrincipalName $i -NewPassword "password"

}
