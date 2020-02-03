# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  
   config.vm.provision "shell", inline: "echo Iniciando aprovisionamiento"
   #config.ssh.forward_agent = true


   #Instalamos Master
   (1..1).each do |i|
      config.vm.define "master-#{i}" do |master|
         master.vm.box="centos/7"
         master.vm.hostname= "master"
         master.vm.network "public_network", ip: "192.168.1.9#{i}"
         master.vm.provider "virtualbox" do |v|
            v.memory = 2048
            v.cpus = 1
         end   
         
         master.vm.provision "shell", inline: "echo Actualizando paquetes"
         master.vm.provision "shell", path: "update_os.sh", :args => [i] 
         master.vm.provision "shell", inline: "echo Instalando Docker"
         master.vm.provision "shell", path: "install_docker.sh", :args => [i] 
   
      end
   end   

     #Instalamos Worker
     (10..10).each do |i|
      config.vm.define "worker-#{i}" do |worker|
         worker.vm.box="centos/7"
         worker.vm.hostname= "worker"
         worker.vm.network "public_network", ip: "192.168.1.1#{i}"
         worker.vm.provider "virtualbox" do |v|
            v.memory = 2048
            v.cpus = 1
         end   
         
         worker.vm.provision "shell", inline: "echo Actualizando paquetes"
         worker.vm.provision "shell", path: "update_os.sh", :args => [i] 
         worker.vm.provision "shell", inline: "echo Instalando Docker"
         worker.vm.provision "shell", path: "install_docker.sh", :args => [i] 
      
      end
   end   
end
