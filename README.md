# Nomad+Consul+TLS Example

A collection of certificates and configurations for testing TLS with Nomad and
Consul.

* Certificates created with [cfssl](https://cfssl.org/)
* [Nomad's TLS Configuration](https://www.nomadproject.io/docs/agent/encryption.html)
* [Nomad's Consul Configuration](https://www.nomadproject.io/docs/agent/configuration/consul.html)
* [Consul's Encryption Configuration](https://www.consul.io/docs/agent/encryption.html) 

## Running

```sh
### In ./consul/ ###

# Start consul server
consul agent -config-file=server.json -advertise=127.0.0.1

# Start consul client
consul agent -config-file=client.json -advertise=127.0.0.1

### In ./nomad/ ###

# Start nomad server
nomad agent -config=server.hcl

# Start nomad client
nomad agent -config=client.hcl

# To use the nomad CLI (note https:// in address)
nomad server-members -address=https://localhost:4646 -ca-path=ca/ca.pem
```

## Layout

```
github.com/schmichael/nomad-tls
│
├── ca
│   ├── ca.csr           CA Signing Request
│   ├── ca-key.pem       CA Private Key
│   └── ca.pem           CA Certifate
├── consul
│   ├── client.json      Consul Client Configuration
│   ├── consul.csr       Consul Signing Request
│   ├── consul-csr.json  Consul Certificate CFSSL Config
│   ├── consul-key.pem   Consul Private Key
│   ├── consul.pem       Consul Certificate
│   └── server.json      Consul Server Configuration
└── nomad
    ├── client.hcl       Nomad Client Configuration
    ├── nomad.csr        Nomad Signing Request
    ├── nomad-csr.json   Nomad Certificate CFSSL Config
    ├── nomad-key.pem    Nomad Private Key
    ├── nomad.pem        Nomad Certificate
    └── server.hcl       Nomad Server Configuration

```
