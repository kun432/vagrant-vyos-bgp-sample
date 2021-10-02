#!/bin/vbash

source /opt/vyatta/etc/functions/script-template

set interfaces loopback lo address 2.2.2.2/32

set protocols bgp 65002 neighbor 10.10.1.1 remote-as '65001'
set protocols bgp 65002 neighbor 10.10.1.1 update-source '10.10.1.2'
set protocols bgp 65002 neighbor 10.10.2.2 remote-as '65003'
set protocols bgp 65002 neighbor 10.10.2.2 update-source '10.10.2.1'
set protocols bgp 65002 address-family ipv4-unicast network '192.168.2.0/24'
set protocols bgp 65002 parameters router-id '2.2.2.2'

set protocols static route 192.168.2.0/24 blackhole distance '254'

commit
save