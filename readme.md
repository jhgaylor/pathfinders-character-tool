# Process

- Dev on `app/`
- from the root of the project, run `./deploy/build-and-upload.sh` which will create the artifact, stuff it onto s3, and then make an ami with the app loaded on it.
- to deploy, stick the new ami id into terraform, and run terraform plan & apply

# Goals


**Ops**

- [x] "build pipeline" that deposits release into s3
- [x] Deploy to aws
- [x] Deploy in a resilient fashion
- [x] Make a better service that will restart if it dies
- [x] Remove ansible provisioner in favor of packer
- [x] Deploy with nginx in front
- [x] make packer aware of the current version in package.json
- [ ] Manage EBS volumes provisioned for each instance using terraform if necessary to clean up after ourselves
- [ ] TF a hosted database service (rds psql? nosql?)
- [ ] Bring vars like region closer to the tf from the ansible once ansible provider is replaced or upgraded
- [ ] Consider ELB instead of nginx
- [ ] TF managed ssh key pairs

**Coding**

- [ ] Add ecmascript 2016
- [ ] Add react support compiled on the server
- [ ] Add a database
- [ ] Migration plan for database schemas
