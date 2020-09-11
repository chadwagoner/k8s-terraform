# k8 terraform

## Install
Running the following script to create the needed file to store Digital Ocean API Token. The script will prompt you for the API Token.

Filename: **config_digital_ocean.sh**

Run the following command for Terraform to pull down the required module(s): `terraform init k8s-cluster-minimal/`

## Supported Terraform Providers
* Digital Ocean

## Environments
### Splunk Single
##### Servers
| Server Name        | Splunk Function |
|:-------------------|:----------------|
| k8s-master-1001    | Master          |
| k8s-worker-1001    | Worker          |
| k8s-worker-1002    | Worker          |
| k8s-worker-1003    | Worker          |

##### Commands
**Plan:** `terraform plan k8s-cluster-minimal/`

**Build:** `terraform apply k8s-cluster-minimal/`

**Destroy:** `terraform destroy k8s-cluster-minimal/`