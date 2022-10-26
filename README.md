# adp-afs
Document updated: 10/26/2022

### Introduction
The ADP 7.2.1 package distributes AFS 1.x. The ACS & Share addons are not compatible with the ACS 7.2 repository.

Using the distributed afs:7.2.1 image as a base, removed the deployed federation and tsearch applications and replace them with AFS 2.1.2 versions.


### Building
Acquire the federation.war and tsearch.war files from [Alfresco Software Downloads](https://community.hyland.com/login?returnUrl=/customer-portal/5097/downloads/alfresco?category=Alfresco%20Content%20Services%20Modules%20and%20Additions) and place in the same directory.

Build the image - `docker build -t AFS212 --no-cache`