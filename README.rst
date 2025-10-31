Milabench Dev Environment
=========================

* Agent: milabench agent when testing milabench outside of the cluster
* dashboard: milabench dashboard for data analysis and run automation
* data: cached milabench run data
* deploy: deployment script for mila infrastructure
* milabench: benchmarking suite





Configuration réseau

L’IP de la machine est 

Elle est situé derière le proxy headlab (ip 172.16.2.26)
Configuration SSH côté client

pour y accéder simplement, ajoutez ceci à votre fichier ~/.ssh/config :
Host headlab
    User <your mila account (ex: bruno.carrez)>   # <= GOOGLE ACCOUNT NAME 
    HostName 172.16.2.26
 
Host milabench
    User <login>
    HostName 
    ProxyJump headlab

Note: si vous n’avez pas encore accès au gateway headlab (pour le VPN), il sera pratique d’y configurer votre clé SSH publique pour une connexion sans mot de passe.

Le mot de passe pour headlab est celui de votre compte @mila.quebec. 