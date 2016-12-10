name          "pathfinder"
description   "A combined install of pathfinder-ui and pathfinder-app"
run_list      "recipe[base]"
default_attributes(
  # "apache2" => { "listen_ports" => [ "80", "443" ] }
)