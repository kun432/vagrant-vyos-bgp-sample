#!/bin/vbash

source /opt/vyatta/etc/functions/script-template

set interfaces loopback lo address 1.1.1.1/32

set protocols bgp 65001 neighbor 10.10.1.2 remote-as '65002'
set protocols bgp 65001 neighbor 10.10.1.2 update-source '10.10.1.1'
set protocols bgp 65001 address-family ipv4-unicast network '192.168.1.0/24'
set protocols bgp 65001 parameters router-id '1.1.1.1'

set protocols static route 192.168.1.0/24 blackhole distance '254'

commit
save