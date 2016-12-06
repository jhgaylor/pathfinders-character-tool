# Process

- Dev on `app/`
- from the root of the project, run `./deploy/build-and-upload.sh` which will create the artifact, stuff it onto s3, and then make an ami with the app loaded on it.
- to deploy, stick the new ami id into terraform, and run terraform plan & apply

# Goals

**Stretch**

- [ ] Deploy another hello-world app, pulling the proper code into a shared repo and use scripts to glue that all together for optimum reusability.

**Ops**

- [x] "build pipeline" that deposits release into s3
- [x] Deploy to aws
- [x] Deploy in a resilient fashion
- [x] Make a better service that will restart if it dies
- [x] Remove ansible provisioner in favor of packer
- [x] Deploy with nginx in front
- [x] make packer aware of the current version in package.json
- [x] Bring vars like region closer to the tf from the ansible once ansible provider is replaced or upgraded
- [ ] Make service correctly start up when using terraform to start a service via a packer'd ami
- [ ] TF a hosted database service (rds psql? nosql?)
- [ ] Consider ELB instead of nginx
- [ ] TF managed ssh key pairs in core

**Coding**

- [ ] Add ecmascript 2016
- [ ] Add react support compiled on the server
- [ ] Add a database
- [ ] Migration plan for database schemas
