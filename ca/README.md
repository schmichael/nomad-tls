CA
==

Test Certificate Authority for generating Nomad and Consul certificates.

Note that the Subject Common Name doesn't matter for the CA certificate. The CA serves two purposes:

1. The key must be used to sign certificates for both Nomad and Consul.
2. The certificate must be used by both Nomad and Consul for verifying one
   another's certificates.
