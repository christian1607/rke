#/bin/bash
yum update -y

echo "comprobando modulos necesarios para RKE"

for module in br_netfilter ip6_udp_tunnel ip_set ip_set_hash_ip ip_set_hash_net iptable_filter iptable_nat iptable_mangle iptable_raw nf_conntrack_netlink nf_conntrack nf_conntrack_ipv4   nf_defrag_ipv4 nf_nat nf_nat_ipv4 nf_nat_masquerade_ipv4 nfnetlink udp_tunnel veth vxlan x_tables xt_addrtype xt_conntrack xt_comment xt_mark xt_multiport xt_nat xt_recent xt_set  xt_statistic xt_tcpudp;
do
    if ! modprobe  $module; then
        echo "module $module is not present";
    fi;
done

sudo echo '1' > /proc/sys/net/bridge/bridge-nf-call-iptables

#Deshabilitamos SELINUX 
echo "Deshabilitamos SELINUX"
sudo setenforce 0
sudo sed -i --follow-symlinks 's/SELINUX=enforcing/SELINUX=disabled/g' /etc/sysconfig/selinux

#Deshabilitamos la configuracion swap
echo "Deshabilitamos la configuracion swap"
sudo swapoff -a

#Deshabilitamos el firewall (no recomendado: se deberia definir las reglas de entrada y salida (https://rancher.com/docs/rke/latest/en/os/#ports))
echo "Deshabilitamos el firewall"
systemctl disable firewalld


#Configuracion SSH
echo "Configuracion SSH"
sudo sed -i "/^[^#]*PasswordAuthentication[[:space:]]no/c\PasswordAuthentication yes" /etc/ssh/sshd_config
sudo service sshd restart
ssh-keygen -t rsa -N "" -f /home/vagrant/.ssh/id_rsa 2>/dev/null <<< y >/dev/null



