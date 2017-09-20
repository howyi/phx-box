# phx-box #
Vagrantfile for [Phoenix Framework](http://www.phoenixframework.org) (v1.3.0)

Box link: https://app.vagrantup.com/howyi/boxes/phx
```bash
$ vagrant init howyi/phx
$ vagrant up
```
<hr>

### 1) Setup Vagrant ###

1. Install VirtualBox https://www.virtualbox.org/
2. Install Vagrant https://www.vagrantup.com/docs/installation/index.html
3. `vagrant plugin install vagrant-vbguest`  
4. `git clone git@github.com:howyi/phx-box.git`
5. `cd phx-box`
6. `vagrant up`

### 2) Configure SSH ###
1. `vagrant ssh-config --host phx >> ~/.ssh/config`  
2. `ssh phx`  

### 3) Start new project ###
参考 : https://hexdocs.pm/phoenix/up_and_running.html

`mix phx.new hello --database mysql`  
<hr>

## File access from Samba
```
path: \\192.168.33.117\vagrant
user: vagrant  
password: vagrant  
```

## Table view from HeidiSQL
Require [plink](https://www.chiark.greenend.org.uk/~sgtatham/putty/)
### setting
|          |                   |
| -------- | ----------------- |
| NetWotk  | MySQL(SSH tunnel) |
| Host     | 127.0.0.1         |
| User     | root              |
| Password |                   |
| Port     | 3306              |
### SSH tunnel
|                 |                                                |
| --------------- | ---------------------------------------------- |
| SSH Host        | 192.168.33.117                                 |
| Port            | 22                                             |
| User            | vagrant                                        |
| Password        | vagrant                                        |
| Private Key     | **[Repository path]**/insecure_private_key.ppk |
| Local Port      | 2                                              |

### Environment  
|                   |        |
| ----------------- | ------ |
| Ubuntu            | 16.04  |
| MySQL             | 5.7.19 |
| node              | 7.10.0 |
| npm               | 4.2.0  |
| Erlang            | 7.2    |
| Elixir            | 1.4.4  |
| Phoenix Framework | v1.3.0 |
