#connect to the vCenter
connect-viserver 192.168.1.22

#get the ESXi host
$vmhost = get-vmhost -name 192.168.1.21

#connect to the "esxcli" command environmant
$esxcli = Get-EsxCli -VMHost $vmhost -v2

#create temp user
$arguments = $esxcli.system.account.add.CreateArgs()
$arguments.id = 'utente_prova'
$arguments.password = 'Australopitec0!!'
$arguments.passwordconfirmation = 'Australopitec0!!'
$esxcli.system.account.add.Invoke($arguments)