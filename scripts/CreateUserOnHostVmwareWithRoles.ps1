#connect to the vCenter
connect-viserver 192.168.1.22

#get the ESXi host
$vmhost = get-vmhost -name 192.168.1.21

#connect to the "esxcli" command environmant
$esxcli = Get-EsxCli -VMHost $vmhost -v2

#create temp user
$arguments = $esxcli.system.account.add.CreateArgs()
$arguments.id = 'utente_prova'
$arguments.password = 'password'
$arguments.passwordconfirmation = 'password'
$esxcli.system.account.add.Invoke($arguments)

#Set tempuser to Admin
$arguments = $esxcli.system.permission.set.CreateArgs()
$arguments.id = 'utente_prova'
$arguments.role = "Admin"
$esxcli.system.permission.set.Invoke($arguments)