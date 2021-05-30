# Cluster Setup
In this folder, you find the terrafom files we used to setup the K8S cluster, it could be a minikube server for development use, or any other cloud/on-premise cluster.

## Structure
    ├── helm-charts                          # Helm charts module
    │   ├── jupyterhub-config.yml            # jupyterhub helm chart values
    │   ├── jupyterhub.tf                    # jupyterhub helm chart config
    │   ├── minio.tf                         # minio helm chart config
    │   ├── outputs.tf                       # the file wehre we define the output variables from the module
    │   ├── spark-on-k8s-operator.tf         # spark-on-k8s-operator helm chart config
    │   └── variables.tf                     # the file where we define the input variables for the module
    ├── main.tf                              # the file where we load the different modules
    ├── providers.tf                         # the file where we setup the different providers
    ├── variables.tf                         # the file where we define the input variables for the module
    ├── versions.tf                          # the file where we import the providers, and select their versions and the terraform version
    └── terraform.tfvars                     # a optional private file where we can define the variables value


## Variables
To setup the cluster, we need the credentials config file, and the context name. We can pass these information to terraform on each command, or create a tfvars file contains all the variables values:  
#### **`terraform.tfvars`**
```terraform
kubernetes-config-path = "~/.kube/config"
kubernetes-context = "minikube"
```

## Cluster setup
```bash
terraform init
terraform plan -out plan
terraform apply plan
```
