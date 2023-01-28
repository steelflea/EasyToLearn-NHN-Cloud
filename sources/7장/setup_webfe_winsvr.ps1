#ps1_sysnative

#Setup IIS
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

#Create Default.html
Set-Content -Path "C:\inetpub\wwwroot\Default.htm" -Value "Running Creator Portal Web Service from host $($env:computername) !"
