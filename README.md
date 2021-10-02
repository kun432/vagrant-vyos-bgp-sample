# vagrant-vyos-bgp-sample

<img src="https://github.com/kun432/vagrant-vyos-bgp-sample/raw/main/vagrant-vyos-bgp-sample.png" width=800 />

```shell
$ git clone https://github.com/kun432/vagrant-vyos-bgp-sample.git
$ cd vagrant-vyos-bgp-sample
$ ./vagrant-ctrl.sh up
```

```shell
$ vagrant ssh pc-1

vagrant@pc-1:~$ ping 192.168.2.11
vagrant@pc-1:~$ ping 192.168.3.11
```

```shell
$ vagrant ssh rt-1

vagrant@rt-1.internal:~$ show ip bgp
vagrant@rt-1.internal:~$ show ip route
```