#ps1_sysnative

##1.로그 드라이브 구성
#새로운 디스크 확인 및 초기화 
Get-Disk | Where-Object PartitionStyle -EQ 'RAW' | Initialize-Disk
#파티션 작업 및 드라이브 문자 할당
New-Partition -DiskNumber 1 -UseMaximumSize -DriveLetter L
#포맷 작업
Format-Volume -DriveLetter L -FileSystem NTFS -NewFileSystemLabel capsulelog -Confirm:$false

##2. 웹 서비스 구성
#IIS 설치
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

#Default.html 배포
Set-Content -Path "C:\inetpub\wwwroot\Default.htm" -Value "Running Human Capsule Management Portal Web Service from host $($env:computername) !"

#$ipv4 = (Get-NetIPAddress | Where-Object {$_.AddressState -eq "Preferred" -and $_.ValidLifetime -lt "24:00:00"}).IPAddress
#Set-Content -Path "C:\inetpub\wwwroot\Default.htm" -Value "Running Human Capsule Management Portal Web Service from host IP $($ipv4) !"