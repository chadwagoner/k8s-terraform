### Configure - Provider - DigitalOcean
provider "digitalocean" {
    token = var.digitalocean-api-token
}

### DigitalOcean - Upload SSH Key
#### Server Key
resource "digitalocean_ssh_key" "k8s-ssh" {
    name = "k8s-ssh"
    public_key = file("~/.ssh/id_rsa.pub")
}

### DigitalOcean - Droplet(s)
#### Master
##### Master - k8s-master-1001
resource "digitalocean_droplet" "k8s-master-1001" {
    name = "k8s-master-1001"
    image = "ubuntu-20-04-x64"
    size = "s-2vcpu-4gb"
    region = "nyc3"
    tags = [
        digitalocean_tag.k8s-all.name, 
        digitalocean_tag.k8s-master-all.name, 
        digitalocean_tag.k8s-master-1001.name
    ]
    ssh_keys = [digitalocean_ssh_key.k8s-ssh.fingerprint]

    provisioner "local-exec" {
        when = destroy
        command = "ssh-keygen -R ${self.ipv4_address}"
    }
}

#### Worker
##### Worker - k8s-worker-1001
resource "digitalocean_droplet" "k8s-worker-1001" {
    name = "k8s-worker-1001"
    image = "ubuntu-20-04-x64"
    size = "s-4vcpu-8gb"
    region = "nyc3"
    tags = [
        digitalocean_tag.k8s-all.name, 
        digitalocean_tag.k8s-worker-all.name, 
        digitalocean_tag.k8s-worker-1001.name
    ]
    ssh_keys = [digitalocean_ssh_key.k8s-ssh.fingerprint]
    volume_ids = [digitalocean_volume.k8s-worker-1001-vol1.id]

    provisioner "local-exec" {
        when = destroy
        command = "ssh-keygen -R ${self.ipv4_address}"
    }
}

##### Worker - k8s-worker-1002
resource "digitalocean_droplet" "k8s-worker-1002" {
    name = "k8s-worker-1002"
    image = "ubuntu-20-04-x64"
    size = "s-4vcpu-8gb"
    region = "nyc3"
    tags = [
        digitalocean_tag.k8s-all.name, 
        digitalocean_tag.k8s-worker-all.name, 
        digitalocean_tag.k8s-worker-1002.name
    ]
    ssh_keys = [digitalocean_ssh_key.k8s-ssh.fingerprint]
    volume_ids = [digitalocean_volume.k8s-worker-1002-vol1.id]

    provisioner "local-exec" {
        when = destroy
        command = "ssh-keygen -R ${self.ipv4_address}"
    }
}

##### Worker - k8s-worker-1003
resource "digitalocean_droplet" "k8s-worker-1003" {
    name = "k8s-worker-1003"
    image = "ubuntu-20-04-x64"
    size = "s-4vcpu-8gb"
    region = "nyc3"
    tags = [
        digitalocean_tag.k8s-all.name, 
        digitalocean_tag.k8s-worker-all.name, 
        digitalocean_tag.k8s-worker-1003.name
    ]
    ssh_keys = [digitalocean_ssh_key.k8s-ssh.fingerprint]
    volume_ids = [digitalocean_volume.k8s-worker-1003-vol1.id]

    provisioner "local-exec" {
        when = destroy
        command = "ssh-keygen -R ${self.ipv4_address}"
    }
}

### DigitalOcean - Volume(s)
#### Worker
##### Worker - k8s-worker-1001
resource "digitalocean_volume" "k8s-worker-1001-vol1" {
  region                  = "nyc3"
  name                    = "k8s-worker-1001-vol1"
  size                    = 100
  initial_filesystem_type = "ext4"
}

##### Worker - k8s-worker-1002
resource "digitalocean_volume" "k8s-worker-1002-vol1" {
  region                  = "nyc3"
  name                    = "k8s-worker-1002-vol1"
  size                    = 100
  initial_filesystem_type = "ext4"
}

##### Worker - k8s-worker-1003
resource "digitalocean_volume" "k8s-worker-1003-vol1" {
  region                  = "nyc3"
  name                    = "k8s-worker-1003-vol1"
  size                    = 100
  initial_filesystem_type = "ext4"
}

### DigitalOcean - Project
#### k8s-cluster-minimum
resource "digitalocean_project" "k8s-cluster-minimum" {
    name        = "k8s-cluster-minimum"
    description = "k8s Development"
    purpose     = "k8s"
    environment = "Development"
    resources   = [
        digitalocean_droplet.k8s-master-1001.urn, 
        digitalocean_droplet.k8s-worker-1001.urn, 
        digitalocean_droplet.k8s-worker-1002.urn, 
        digitalocean_droplet.k8s-worker-1003.urn
    ]
}

### DigitalOcean - Tag(s)
#### All
resource "digitalocean_tag" "k8s-all" {
    name = "k8s-all"
}

#### Master 
##### Master - All
resource "digitalocean_tag" "k8s-master-all" {
    name = "k8s-master-all"
}

#### Worker 
##### Worker - All
resource "digitalocean_tag" "k8s-worker-all" {
    name = "k8s-worker-all"
}

#### Server Specific
##### k8s-master-1001
resource "digitalocean_tag" "k8s-master-1001" {
    name = "k8s-master-1001"
}

##### k8s-worker-1001
resource "digitalocean_tag" "k8s-worker-1001" {
    name = "k8s-worker-1001"
}

##### k8s-worker-1002
resource "digitalocean_tag" "k8s-worker-1002" {
    name = "k8s-worker-1002"
}

##### k8s-worker-1003
resource "digitalocean_tag" "k8s-worker-1003" {
    name = "k8s-worker-1003"
}