log_level = "DEBUG"

datacenter = "dc1"

data_dir = "/tmp/nomad-tls-client"

name = "nomad-tls-client"

client {
  enabled = true
  options = {
    "driver.raw_exec.enable" = "1"
  }
}

# Bump ports to avoid conflicts with server
ports {
  http = 5646
  rpc  = 5647
  serf = 5648
}

server {
  enabled = false
}

bind_addr = "0.0.0.0"

# MUST SET if your hostname does not resolve
#advertise {
  #http = "192.168.0.228"
  #serf = "192.168.0.228"
  #rpc  = "192.168.0.228"
#}

tls {
  http = true
  rpc  = true

  ca_file    = "../ca/ca.pem"
  cert_file  = "nomad.pem"
  key_file   = "nomad-key.pem"
 } 

consul {
  address = "localhost:8501"
  ssl = true
  verify_ssl = true 

  ca_file    = "../ca/ca.pem"
  cert_file  = "nomad.pem"
  key_file   = "nomad-key.pem"
}
