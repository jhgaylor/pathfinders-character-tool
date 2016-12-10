node.default['awscli']['version'] = '1.11.23'

node.default['base']['packages'] = %w{
  libffi-dev
  libssl-dev
  python-dev
  python-pip
  build-essential
}