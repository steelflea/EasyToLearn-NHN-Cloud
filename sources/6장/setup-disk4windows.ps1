#새로운 디스크 확인 및 초기화 
Get-Disk | Where-Object PartitionStyle -EQ 'RAW' | Initialize-Disk
#파티션 작업 및 드라이브 문자 할당
New-Partition -DiskNumber 1 -UseMaximumSize -DriveLetter X
#포맷 작업
Format-Volume -DriveLetter X -FileSystem NTFS -NewFileSystemLabel ziondata -Confirm:$false