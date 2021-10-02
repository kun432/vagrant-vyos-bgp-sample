#!/bin/vbash

source /opt/vyatta/etc/functions/script-template

set interfaces loopback lo address 3.3.3.3/32

set protocols bgp 65003 neighbor 10.10.2.1 remote-as '65002'
set protocols bgp 65003 neighbor 10.10.2.1 update-source '10.10.2.2'
set protocols bgp 65003 address-family ipv4-unicast network '192.168.3.0/24'
set protocols bgp 65003 parameters router-id '3.3.3.3'

set protocols static route 192.168.3.0/24 blackhole distance '254'

commit
save