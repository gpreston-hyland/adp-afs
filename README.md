# adp-afs
Document updated: 10/26/2022

### Introduction
The ADP 7.2.1 package distributes AFS 1.x. The ACS & Share addons are not compatible with the ACS 7.2 repository. Also, the **AFS backend should be run on its own instance**. The memory requirements for running ACS/APS and AFS on the same host is significant.

Using the distributed afs:7.2.1 image as a base, removed the deployed federation and tsearch applications and replace them with AFS 2.1.2 versions.


### Building
Acquire the federation.war and tsearch.war files from [Alfresco Software Downloads](https://community.hyland.com/login?returnUrl=/customer-portal/5097/downloads/alfresco?category=Alfresco%20Content%20Services%20Modules%20and%20Additions) and place in the same directory.

Build the image - `docker build -t afs212 --no-cache`

### Changes to ADP 7.2.1 to utilize Updated AFS image
Change the afs entry in the services section of the `docker-compose.yml`.

```yaml
  afs:
#    image: xxxxxxxxxxxxx.dkr.ecr.us-east-1.amazonaws.com/adp/afs:7.2.1
    image: afs212:latest
```

**If ADP is up, stop it prior to making the following change.**

Edit the config.json file to only start the afs and nginx services.

```json
        "services": [
            "afs",
            "nginx"
        ]
```

Start ADP.
