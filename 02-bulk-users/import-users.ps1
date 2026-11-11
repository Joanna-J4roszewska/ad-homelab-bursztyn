$ludzie = Import-Csv C:\Scripts\pracownicy.csv -Encoding UTF8
# Lab only irl passwords would be generated per user!!!
$haslo = ConvertTo-SecureString "Bursztyn!2026Start" -AsPlainText -Force

foreach ($osoba in $ludzie) {
    Write-Host "Zakladam konto: $($osoba.Login)"
    Write-Host "OU: OU=$($osoba.Department),OU=Bursztyn,DC=lab2,DC=local"
    Write-Host "Grupa: GG_$($osoba.Department)"
    Write-Host "Rola: $($osoba.Role)"

    New-ADUser `
        -Name "$($osoba.GivenName) $($osoba.Surname)" `
        -GivenName $osoba.GivenName `
        -Surname $osoba.Surname `
        -SamAccountName $osoba.Login `
        -UserPrincipalName "$($osoba.Login)@lab2.local" `
        -Path "OU=$($osoba.Department),OU=Bursztyn,DC=lab2,DC=local" `
        -AccountPassword $haslo `
        -Enabled $true `
        -ChangePasswordAtLogon $true

    Add-ADGroupMember -Identity "GG_$($osoba.Department)" -Members $osoba.Login

    if ($osoba.Role -eq "Kierownik") {
        Add-ADGroupMember -Identity "GG_Kierownicy" -Members $osoba.Login
    }
}
