log_level = "DEBUG"

datacenter = "dc1"

data_dir = "/tmp/nomad-tls-server"

name = "nomad-tls-server"

client {
  enabled = false
}

server {
  enabled          = true
  bootstrap_expect = 1
  num_schedulers   = 1
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
