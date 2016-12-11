# Process

**First Run**: You need to make sure that you have the git submodule pulled in using `git submodule update --remote`

- Dev on `api-app/` or `ui-app/`
- from the root of the project, run `./<app>/build-and-upload.sh` which will create the artifact, stuff it onto s3
- to make a new release (both apps get shipped as a single unit), run `cd ./deploy/package/; ./build-ami.sh`
- to deploy, run terraform. it will see the new ami

# Goals

**Stretch CMDB**
- [x] Pull out ansible into a shared repo
- [ ] Make a node app cookbook
- [ ] Make a static site cookbook
- [ ] Deploy pathfinder using new common cookbooks
- [ ] Deploy another hello world app using generalized chef and terraform code, proving that other node apps are just as easy to deploy
- [ ] Make a java (spring boot?) app cookbook
- [ ] Deploy a java app the same way.
- [ ] chef RDBMS solution backed by ebs

**Stretch Infrastructure**
- [x] Pull out code for immutable-app into a module
- [x] Pull the code for immutable-app into a place where it can be shared
- [ ] Use ASG not aws_instance
- [ ] Make PoC HA deploy w/ an elb in front of private subnets
- [ ] OpenVPN to my laptop to give access to private subnets

**Ops**

- [x] "build pipeline" that deposits release into s3
- [x] Deploy to aws
- [x] Deploy in a resilient fashion
- [x] Make a better service that will restart if it dies
- [x] Remove ansible provisioner in favor of packer
- [x] Deploy with nginx in front
- [x] make packer aware of the current version in package.json
- [x] Bring vars like region closer to the tf from the ansible once ansible provider is replaced or upgraded
- [x] Make service correctly start up when using terraform to start a service via a packer'd ami
- [x] TF managed ssh key pairs in core
- [x] convert ansible to chef-solo
- [x] Get a grasp on tar output folders and get to `/opt/pct-ui/static` (this was `--strip-components x`)
- [ ] chef mongodb + ebs solution

**Coding**

- [x] Add ecmascript 2016
- [x] bundle js so jsx isn't shipped to the browser
- [ ] Add a database
- [ ] Migration plan for database schemas
