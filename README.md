# Automated Script To Install Kali Tools


---
## 🚀 Usage
 
```bash
git clone https://github.com/andrewmamdouh122/install_your_tools.git
cd install_your_tools
chmod +x *
```
to add kali repo 
```bash
./kali_repo.sh
```
install any tool u want 
```bash
sudo apt install nmap sqlmap metasploit-framework john hydra ffuf nuclei subfinder seclists netdiscover nikto python3-pip python2 python3-scapy python2 
```

then remove the kali repo ```./remove_kali.sh```

## ⚠️ Disclaimer Never Upgrade Your System While The Kali Repo In Your System 
---
### if u faced peoblem in ur network after the installing use this commands
```bash
sudo ip link set eth0 up
sudo dhclient eth0
```
Make it persistent By
```bash
sudo echo "auto eth0
iface eth0 inet dhcp" >>/etc/network/interfaces
sudo systemctl restart networking
```
