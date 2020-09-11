### Outputs
#### Master
##### Master - k8s-master-1001
output "k8s-master-1001" {
    value = "${digitalocean_droplet.k8s-master-1001.ipv4_address}"
}

#### Worker
##### Worker - k8s-worker-1001
output "k8s-worker-1001" {
    value = "${digitalocean_droplet.k8s-worker-1001.ipv4_address}"
}

##### Worker - k8s-worker-1002
output "k8s-worker-1002" {
    value = "${digitalocean_droplet.k8s-worker-1002.ipv4_address}"
}

##### Worker - k8s-worker-1003
output "k8s-worker-1003" {
    value = "${digitalocean_droplet.k8s-worker-1003.ipv4_address}"
}