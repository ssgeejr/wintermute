

#localuser:Lab123!

# Import AD module
Import-Module ActiveDirectory

# User01 account (Robinette)
New-ADUser `
    -Name "Robinette User" `
    -GivenName "Robinette" `
    -Surname "User" `
    -SamAccountName "robinette" `
    -UserPrincipalName "robinette@814north.local" `
    -AccountPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force) `
    -Enabled $true `
    -PasswordNeverExpires $true

# Blue01 account (SOCUser)
New-ADUser `
    -Name "SOC Analyst" `
    -GivenName "SOC" `
    -Surname "User" `
    -SamAccountName "socuser" `
    -UserPrincipalName "socuser@814north.local" `
    -AccountPassword (ConvertTo-SecureString "P@ssw0rd!" -AsPlainText -Force) `
    -Enabled $true `
    -PasswordNeverExpires $true
