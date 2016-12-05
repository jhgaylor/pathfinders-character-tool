# Installing Ansible

First, download and install the tool. `pip install ansible` should do the trick.

Then configure your system with global ansible settings. Follow this guide if you hit any hiccups. http://binarynature.blogspot.com/2016/01/install-ansible-on-os-x-el-capitan_30.html

On my laptop I did:

`sudo curl -L https://raw.githubusercontent.com/ansible/ansible/devel/examples/ansible.cfg -o /etc/ansible/ansible.cfg`

`sudo curl -L https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.py -o /etc/ansible/ec2.py`

`sudo curl -L https://raw.githubusercontent.com/ansible/ansible/devel/contrib/inventory/ec2.ini -o /etc/ansible/ec2.ini`

That will set your base line configuration. Overrides are already in this repo.

# Using Ansible

You will need to tell ansible which user and ssh key to use.

Right now, we are using the ubuntu user to login so all ansible commands should be affixed with `--user ubuntu`. You will need to use a key that is on the box to connect. If you spun the box, it's the keypair you assigned. Otherwise, talk to Jake about getting your key on the server. Once you know which key to use, affix all ansible commands with `--private-key /PATH/TO/SSH/Key`.

I make this easy with aliases. I put these in `~/.bash_profile`

```
alias aansible="ansible --private-key /Users/jake/.ssh/jake-laptop-aws.pem -u ubuntu "
alias aap="ansible-playbook --private-key /Users/jake/.ssh/jake-laptop-aws.pem -u ubuntu "
alias aansible-playbook=aap
```

Now I can run playbooks with `aap playbook.yaml`.

# Init roles

Run this from ./ relative to this readme. It should only be necessary if you want to bump the version, as the roles are check into source control so they don't get ripped out from under our feet.

`ANSIBLE_ROLES_PATH=./roles ansible-galaxy install -r install_roles.yaml`
