# rke


En el host donde se instala RKE


ssh-copy-id -i /Users/christian/.ssh/id_rsa  vagrant@192.168.1.110


Modificamos a ejecucion:


chmod +x rke


Levantamos el cluster:


./rke up --config  config-k8s-demo.yaml  
