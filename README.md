# Reverse Proxy on Raspberry Pi 4

Enable permanent SSD boot
https://www.makeuseof.com/how-to-boot-raspberry-pi-ssd-permanent-storage/#:~:text=Boot%20Raspberry%20Pi%204%20or%20400%20from%20SSD&text=Click%20the%20Choose%20OS%20button,take%20a%20few%20seconds%20only.

## OS installation:
1. Download "Raspberry Pi Imager" here:
https://www.raspberrypi.com/software/
2. Connect SSD to PC and flash **Raspberry Pi OS (64-bit)** on SSD
3. Once flashed create en empty "SSH" file on ssd to allow SSH access, however you might needs to connect physically and create new user during first boot

## Docker Installation steps:
1. Update all packages
```
sudo apt update & sudo apt -y full-upgrade
```
2. Install Docker
```
curl -sSL https://get.docker.com | sh
```
3. Add permission to Pi User to run Docker Commands
```
sudo usermod -aG docker pi
```
4. Reboot here
```
sudo reboot now
```
5. Test Docker installation
```
docker run hello-world
```
5. IMPORTANT! Install proper dependencies
```
sudo apt-get install -y libffi-dev libssl-dev
sudo apt-get install -y python3 python3-pip
```
6. Install Docker Compose
```
sudo pip3 -v install docker-compose
```
7. If you not using Pi4 GUI - Remove udisks2 - it causes memory leaks
```
sudo apt remove udisks2 & sudo apt -y autoremove
```
8. Clone docker-compose.yaml
```
mkdir ~/docker
cd ~/docker
git clone git clone https://github.com/freender/docker-vm.git
```
9. Pull docker-compose images and start containers
```
docker-compose pull
docker-compose up -d
```

## Gerenic Linux Toolset
```
sudo apt install vim
sudo apt install mc
sudo apt install iotop
```


## Unattended updates:
1. Install unattended-upgrades package
```
sudo apt install unattended-upgrades
sudo apt install apt-listchanges

```
2. Edit 50unattended-upgrades
```
sudo vim /etc/apt/apt.conf.d/50unattended-upgrades
```
3. Change following info
```
// The Raspberry Pi Foundation doesn't use separate a separate security upgrades channel.
// To make sure your RPi has the latest security fixes, you have to install all updates.

Unattended-Upgrade::Origins-Pattern {
// The Raspberry Pi Foundation doesn't use separate a separate security upgrades channel.
// To make sure your RPi has the latest security fixes, you have to install all updates.

Unattended-Upgrade::Origins-Pattern {
        "origin=Raspbian,codename=${distro_codename},label=Raspbian";
        "origin=Raspberry Pi Foundation,codename=${distro_codename},label=Raspberry Pi Foundation";
};

// Automatically reboot *WITHOUT CONFIRMATION* if
//  the file /var/run/reboot-required is found after the upgrade
Unattended-Upgrade::Automatic-Reboot "true";

// If automatic reboot is enabled and needed, reboot at the specific
// time instead of immediately
//  Default: "now"
Unattended-Upgrade::Automatic-Reboot-Time "04:00";
};
```
4. Edit 20auto-upgrades
```
sudo vim /etc/apt/apt.conf.d/20auto-upgrades
```
5. Add following info
```
APT::Periodic::Update-Package-Lists "1";
APT::Periodic::Download-Upgradeable-Packages "1";
APT::Periodic::AutocleanInterval "3";
APT::Periodic::Verbose "1";
APT::Periodic::Unattended-Upgrade "1";
```

## Raspberry Pi 4 firmware upgrade
```
sudo apt update & sudo apt -y full-upgrade
sudo rpi-update
sudo reboot
sudo rpi-eeprom-update -d -a

# Use raspi-config to select either the default-production release or latest update.
sudo raspi-config
sudo reboot
```

## Argon M.2 Soft
1. Download and configure fan speeds:
```
curl https://download.argon40.com/argon1.sh | bash
argonone-config  #configure driver
```
speed mapping:
```
Please provide fan speeds for the following temperatures:
55C (0-100 only):20
60C (0-100 only):40
65C (0-100 only):100
Configuration updated.
```

## Enable FSTRIM
https://www.jeffgeerling.com/blog/2020/enabling-trim-on-external-ssd-on-raspberry-pi

1. Install dependencies
```
sudo su
apt-get install -y sg3-utils lsscsi
```
2. Change max discard bytes
```
echo  2147450880  > /sys/block/sda/queue/discard_max_bytes
vim /etc/udev/rules.d/10-trim.rules
```
3. Add following line
```
ACTION=="add|change", ATTRS{idVendor}=="174c", ATTRS{idProduct}=="55aa", SUBSYSTEM=="scsi_disk", ATTR{provisioning_mode}="unmap"
```

## Enable per container memory tracking in docker (used by telegraf)
1) Edit cmdline.txt file
```
sudo vim /boot/cmdline.txt
```
2) First line should start usign following 2 parameters
```
cgroup_enable=memory cgroup_memory=1
```
3) Reboot
```
sudo reboot
```

## Overclock Pi4
1) Edit the config.txt file 
```
sudo vim /boot/config.txt
```

2) With the following settings:
```
#uncomment to overclock the arm. 700 MHz is the default.
over_voltage=6
arm_freq=2000
```
3) Reboot

## Smart Control
1) Install smartmontools
```
sudo apt install smartmontools
```
2) Update your sudoers file:
```
sudo visudo
```
3) Add the following lines 
```
Cmnd_Alias SMARTCTL = /usr/bin/smartctl
telegraf  ALL=(ALL) NOPASSWD: SMARTCTL
Defaults!SMARTCTL !logfile, !syslog, !pam_session
```

## Statis IP and SLAAC privacy extension:
1. Edit dhcpd.conf
```
sudo vim /etc/dhcpcd.conf
```
2. Change following lines
```
# Generate SLAAC address using the Hardware Address of the interface
slaac hwaddr
# OR generate Stable Private IPv6 Addresses based from the DUID
#slaac private

# Example static IP configuration:
interface eth0
static ip_address=192.168.86.10/24
#static ip6_address=fd51:42f8:caae:d92e::ff/64
static routers=192.168.86.1
static domain_name_servers=8.8.4.4 8.8.8.8 2001:4860:4860::8888
```


## SSH add public key
1. Edit authorized_keys
```
vim ~/.ssh/authorized_keys
```
2. Add key public key from 1Password (SSH - UNRAID - Tower)
3. Adjust permissions
```
chown pi:pi ~/.ssh/authorized_keys
chmod 644 ~/.ssh/authorized_keys
```

## Enable syslog server
TBD
