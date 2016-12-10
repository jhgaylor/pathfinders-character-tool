This is where we control the creation of the aws infrastructure.

# First Run

Make sure you configure your remote state.

`./config-remote.sh` - this will sync down some remote state. when you do terraform applies, you will end up sending the update to s3, so for the most part you should just have to do this once.

# Tear down

The immutable-app module doesn't play well with the dns records output at count 0, so destroying is the easiest way to manage it.