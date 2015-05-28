# NetKAT controller
An exmaple controller to study frenetic 

# Compile the netkat controller
```
cd netkat-tutorial-workspace
./netkat-build Firewall4.native

```

# Run netkat controller
Inside the directory containing Firewall4.native, run:

```
./Firewall4.native

```

# Run mininet
e.g, Controller IP address is: 192.168.56.1

```
sudo mn --controller=remote,ip=192.168.56.1 --topo=tree,2,2 --mac --arp 
```