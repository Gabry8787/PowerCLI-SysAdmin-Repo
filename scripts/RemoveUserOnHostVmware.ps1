#connect to the vCenter
connect-viserver 192.168.1.22

#get the ESXi host
$vmhost = get-vmhost -name 192.168.1.21

#connect to the "esxcli" command environmant
$esxcli = Get-EsxCli -VMHost $vmhost -v2

#remove tempuser
$arguments = $esxcli.system.account.remove.CreateArgs()
$arguments.id = 'utente_prova'
$esxcli.system.account.remove.Invoke($arguments)