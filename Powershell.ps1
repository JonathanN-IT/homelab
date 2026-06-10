PowerShell :
************


-------------
Explication :
-------------

Get-Netadapter = carte reseau
Get-VMSwitch = switch
New-VMSwitch -Name "LABOPS" -SwitchType Private
dir = voir se qu'il y a dans le dossier 
cls ou clear : clean l'affichage
md = cree le dossier

---------------
Creation : VM :
---------------

cd c:\
cd .\VM\
md LABOPS2
cd .\LABOPS2
md SRV-AD01
cd .\SRV-AD01\
New-VHD -Path .\SRV-AD01-DISK1.vhdx -SizeBytes 127GB -Dynamic
New-VHD -Path .\SRV-AD01-DISK1-DIFF.vhdx -ParentPath "C:\PARENT\TEST-SYSPREP2.vhdx" -Differencing
New-VM -Name "SRV-AD01" -Generation 2 -MemoryStartupBytes 8GB -VHDPath .\SRV-AD01-DISK1-DIFF.vhdx -Path .\ -SwitchName "LABOPS" 
set-VMMemory -VMName SRV-AD01 -DynamicMemoryEnabled $false
Set-VMProcessor -VMName SRV-AD01 -Count 2
( si machine client faire ici les commandes dvd )
Start-VM -Name srv-ad01
vmconnect.exe localhost "SRV-AD01"

*******************************
Dans le PowerShell de la VM01 :
*******************************

New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 172.16.50.10 -PrefixLength 24 -DefaultGateway 172.16.50.1 
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 172.16.50.10
Disable-NetAdapterBinding -Name "Ethernet" -ComponentID ms_tcpip6
Rename-Computer -NewName "SRV-AD01" -Restart

------------------------
Active Directory + DNS :
------------------------

Install-WindowsFeature AD-Domain-Services,DNS -IncludeManagementTools
Install-ADDSForest -DomainName "orion.local" -DomainNetbiosName "ORION" -InstallDns

New-ADOrganizationalUnit -Name "ORION-DPT" -Path "DC=orion,DC=local"
New-ADorganizationalUnit -Name "Management" -Path "OU=ORION-DPT,DC=orion,DC=local"
New-ADorganizationalUnit -Name "Developement" -Path "OU=ORION-DPT,DC=orion,DC=local"
New-ADorganizationalUnit -Name "Accounting" -Path "OU=ORION-DPT,DC=orion,DC=local"

New-ADGroup -Name "MGMT-GRP" -GroupScope Global -GroupCategory Security -Path "OU=Management,OU=ORION-DPT,DC=orion,DC=local"
New-ADGroup -Name "DEV-GRP" -GroupScope Global -GroupCategory Security -Path "OU=Developement,OU=ORION-DPT,DC=orion,DC=local"
New-ADGroup -Name "ACC-GRP" -GroupScope Global -GroupCategory Security -Path "OU=Accounting,OU=ORION-DPT,DC=orion,DC=local"

New-ADUser -Name "Sébastien Sotiaux" -SamAccountName "sso" -userPrincipalName "sso@orion.local" -Path "OU=Developement,OU=ORION-DPT,DC=orion,DC=local" -AccountPassword (Read-Host -AsSecureString "Mot de passe") -Enabled $true
Add-ADGroupMember -Identity "DEV-GRP" -Members "sso"
Get-ADGroupMember -Identity "DEV-GRP"

New-ADUser -Name "Benjamin Delaunoy" -SamAccountName "bde" -userPrincipalName "bde@orion.local" -Path "OU=Accounting,OU=ORION-DPT,DC=orion,DC=local" -AccountPassword (Read-Host -AsSecureString "Mot de passe") -Enabled $true
Add-ADGroupMember -Identity "ACC-GRP" -Members "bde"
Get-ADGroupMember -Identity "ACC-GRP"

New-ADUser -Name "Mathis Thomas" -SamAccountName "mth" -userPrincipalName "mth@orion.local" -Path "OU=Management,OU=ORION-DPT,DC=orion,DC=local" -AccountPassword (Read-Host -AsSecureString "Mot de passe") -Enabled $true
Add-ADGroupMember -Identity "MGMT-GRP" -Members "mth"
Get-ADGroupMember -Identity "MGMT-GRP"

*******************************
Dans le PowerShell de la VM02 :
*******************************

Add-computer -DomainName "orion.local" -Restart
Install-WindowsFeature AD-Domain-Services,DNS -IncludeManagementTools

*******************************
Dans le PowerShell de la VM01 :
*******************************
Backup:
-------

cd c:\
md IFM
cd .\IFM\
ntdsutil "activate instance ntds" ifm "create sysvol full c:\IFM" quit quit

robocopy c:\IFM \\SRV-AD02\C$\IFM /E

*******************************
Dans le PowerShell de la VM02 :
*******************************

Install-aDDSDomainController -DomainName "orion.local" -InstallationMediaPath "C:\IFM" -InstallDns


-------
Autre :
-------

Pour iso du dvd et ordre de boot :
----------------------------------

Add-VMDvdRive -VMname SRV-AD01 -Path "C:\Chemin de l'iso"

Variable : 

$dvddrive = Get-VMDvdrive -VMName SRV-AD01

Set-VMFirmware -VMName SRV-AD01 -FirstBootDevice $dvddrive

-----------------------------------------------------------

New = Cree
Get = Voir/Recherche


*************************************************************************************************************
-------------------------------------------------------------------------------------------------------------
*************************************************************************************************************

Exercice SRV-AD02

cd c:\
cd .\VM\
cd .\LABOPS2
md SRV-AD02
cd .\SRV-AD02\
New-VHD -Path .\SRV-AD02-DISK1.vhdx -SizeBytes 127GB -Dynamic
New-VHD -Path .\SRV-AD02-DISK1-DIFF.vhdx -ParentPath "C:\PARENT\TEST-SYSPREP2.vhdx" -Differencing
New-VM -Name "SRV-AD02" -Generation 2 -MemoryStartupBytes 8GB -VHDPath .\SRV-AD02-DISK1-DIFF.vhdx -Path .\ -SwitchName "LABOPS" 
set-VMMemory -VMName SRV-AD02 -DynamicMemoryEnabled $false
Set-VMProcessor -VMName SRV-AD02 -Count 2
( si machine client faire ici les commandes dvd )
Start-VM -Name srv-ad02
vmconnect.exe localhost "SRV-AD02"

*****************************
Dans le PowerShell de la VM :
*****************************

New-NetIPAddress -InterfaceAlias "Ethernet" -IPAddress 172.16.50.11 -PrefixLength 24 -DefaultGateway 172.16.50.1 
Set-DnsClientServerAddress -InterfaceAlias "Ethernet" -ServerAddresses 172.16.50.11
Disable-NetAdapterBinding -Name "Ethernet" -ComponentID ms_tcpip6
Rename-Computer -NewName "SRV-AD02" -Restart

------------------------------------------------------------------------------
Jour : 2
---------

cd c:\VM\LABOPS2
md SRV-FILE01
cd .\SRV-FILE01\
New-VHD -Path .\SRV-FILE01-DISK1-DIFF.vhdx -ParentPath "C:\PARENT\TEST-SYSPREP2.vhdx" -Differencing
New-VM -Name "SRV-FILE01" -Generation 2 -MemoryStartupBytes 8GB -VHDPath .\SRV-FILE01-DISK1-DIFF.vhdx -Path .\ -SwitchName "LABOPS"

set-VMMemory -VMName SRV-FILE01 -DynamicMemoryEnabled $false
Set-VMProcessor -VMName SRV-FILE01 -Count 2

Start-VM -Name SRV-FILE01

