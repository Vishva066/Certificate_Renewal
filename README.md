# Certificate Renewal

This is a simple example of how to renew the certificates in hyperledger fabric network without doing channel update

## Configuration

In the docker-compose-ca.yaml file add the following env to allow the certificate to enrolled even after the certificate is expired

```bash
FABRIC_CA_SERVER_CA_REENROLLIGNORECERTEXPIRY=true
```

Create a new folder called oraganizations/fabric-ca/manufacturer.

**Note create the no of folders as no of organizations as for testing I have only done manufacturer organization**

In this file create the fabric-ca-server-config.yaml file. 

Here in the expiry I have set it to 10 mins so ca-manufacturer generating certificates will be having certificate and it will get expired withtin 10 mins.

Now to use reenroll command along with `--csr.keyrequest.reusekey` to use the same key pair.

Then execute the script file renew.sh

After that docker containers will be automatically restarted with the latest certificates. 

