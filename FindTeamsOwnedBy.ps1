param(
  [string]$searchUser
)

$Teams=@()

Write-Host Retrieving Teams details...
Get-Team | foreach {
 $DisplayName=$_.DisplayName
 Write-Progress -Activity "Processed Teams Count: $Count" "Currently Processing Team: $DisplayName" 
 $GroupID=$_.Groupid
 Get-TeamUser -GroupId $GroupID | foreach {
  if($_.role -eq "owner")
  { 
    if($_.user.ToLower() -eq $searchUser) {
      $Teams += $DisplayName
    }
  }
 }
} 

$Teams
