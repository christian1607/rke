# rke


En el host donde se instala RKE se tiene que copiar la llave privada hacia los nodos que se desee instalar (workers o masters)


ssh-copy-id -i /Users/christian/.ssh/id_rsa  vagrant@192.168.1.110


Modificamos a ejecucion:


chmod +x rke 


Levantamos el cluster:


./rke up --config  config-k8s-demo.yaml  
