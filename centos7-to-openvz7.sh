echo "CentOS 7 to OpenVZ 7 by Taidos";
echo "Credit goes to SolusVM team too";
echo "Please wait to make the changes please";
echo "Dont reboot until is finished";
echo "You need to make SURE that you have one LVM formated in EXT4 for /vz partition";
echo "After you accept the first install is no turning back Do CTRL + X";
echo "--------------------------------------";
yum remove python2-subprocess32
rpm -Uvh https://download.openvz.org/virtuozzo/releases/openvz-7.0.11-235/x86_64/os/Packages/o/openvz-release-7.0.11-3.vz7.x86_64.rpm;
rpm -Uvh https://download.openvz.org/virtuozzo/releases/openvz-7.0.11-235/x86_64/os/Packages/p/python-subprocess32-3.2.7-1.vz7.5.x86_64.rpm;
yum install epel-release -y;
yum -y install python3;
rpm -Uvh http://repo.virtuozzo.com/vzlinux/7/x86_64/os/Packages/r/readykernel-scan-0.11-1.vl7.noarch.rpm;
rpm -Uvh http://repo.virtuozzo.com/vzlinux/7/x86_64/os/Packages/z/zstd-1.4.4-1.vl7.x86_64.rpm;
rpm -Uvh http://repo.virtuozzo.com/vzlinux/7/x86_64/os/Packages/v/vzlinux-release-7-1.vl7.89.x86_64.rpm;
mv /etc/yum.repos.d/CentOS-* /root/;
rpm -e --nodeps --justdb json-c;
yum -y erase jansson;
yum -y localinstall http://repo.virtuozzo.com/vzlinux/7.7/x86_64/os/Packages/j/jansson-2.10-1.vl7.1.x86_64.rpm;
yum -y localinstall http://repo.virtuozzo.com/vzlinux/7.7/x86_64/os/Packages/j/json-c-0.11-13.vl7.1.x86_64.rpm;
#yum downgrade glibc glibc-common
yum -y install prlctl prl-disp-service vzkernel *ploop* *ez.noarch python36-pip prl-vzvncserver;
pip3 install configobj
yum -y update;
mv /usr/libexec/ovz-template-converter /usr/libexec/ovz-template-converter.orig;
wget -O /usr/libexec/ovz-template-converter https://raw.githubusercontent.com/taidos/svm_patches/master/ovz-template-converter.patched;
chmod +x /usr/libexec/ovz-template-converter
echo "If you are on OVH fallow this commands:";
echo "mkdir /boot/efi/EFI/virtuozzo/";
echo "grub2-mkconfig -o /boot/efi/EFI/virtuozzo/grub.cfg";
echo "Now after reboot please remember to put the modules on:";
echo "modprobe ploop";
echo "modprobe pfmt_ploop1";
echo "modprobe pfmt_raw";
echo "modprobe pio_direct";
echo "Execute then after reboot, now you can REBOOT :)";
echo "--------------------------------------";
