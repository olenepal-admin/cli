#!/bin/bash

function install {
  # create service directory
  mkdir -p /srv/cloud9

  # create yml(s)
  {
echo "version: 2.1"
echo "services:"
echo "  cloud9:"
echo "    image: linuxserver/cloud9"
echo "    volumes:"
echo "      - \"/srv/cloud9:/root/.cloud9\""
echo "      - /var/run/docker.sock:/var/run/docker.sock"
echo "    ports:"
echo "     - 9999:8000"
echo "version: \"2.1\""
  } > /srv/cloud9/cloud9.yml
  
  # add autorun
  {
    echo "cloud9_autorun=true"
    echo
    echo "if [ \"\$cloud9_autorun\" = true ]; then"
    echo "  treehouses services cloud9 up"
    echo "fi"
    echo
    echo
  } > /srv/cloud9/autorun
}

# environment var
function uses_env {
  echo false
}

# add supported arm(s)
function supported_arms {
  echo "armv7l"
  echo "aarch64"
  echo "x86_64"
}

# add port(s)
function get_ports {
  echo "9999"
}

 #add size (in MB)
function get_size {
 echo "688"
}

# add info
function get_info {
  echo "https://github.com/linuxserver/docker-cloud9.git"
  echo
  echo "\"Cloud9 is a complete web based IDE with terminal access.\""
}

# add svg icon
function get_icon {
  cat <<EOF
<svg xmlns="http://www.w3.org/2000/svg" width="2500" height="2285" preserveAspectRatio="xMidYMid" viewBox="0 0 256 234">
  <defs/>
  <path fill="#00A8E9" d="M14.694 222.613c3.899 1.8 7.797 2.599 11.696 2.599 3.698 0 7.297-.8 10.795-2.499 1.5-.7 2.7-1.1 3.5-1.3 1.499-.3 2.598-.7 2.998-1.1 1.1-.999 2.1-2.298 2.899-3.997.8-1.7 1.2-3.2 1.2-4.599 0-1.1-.3-1.999-.9-2.799-.6-.8-1.3-1.1-2.1-1.1-.6 0-1.299.4-2.199 1.3-1 1-2.499 1.8-4.298 2.5-1.9.6-3.699.899-5.598.899-5.098 0-9.096-2.2-11.795-6.697-2-3.3-3.099-6.998-3.099-11.096 0-2.899.7-5.298 2.1-6.997 1.399-1.7 3.298-2.6 5.697-2.6 2.499 0 4.898.8 7.097 2.4.9.7 1.7 1.4 2.3 2.199.6.8 1.399 2.1 2.498 3.998.7 1.3 1.4 2.2 2.2 2.7.8.5 1.699.799 2.898.799 1.3 0 2.5-.4 3.499-1.1 1.9-1.3 2.899-3.398 2.899-6.197 0-3.999-1.1-7.397-3.399-10.096-.9-1.1-1.999-1.7-3.199-1.7-.4 0-.7 0-1 .1-.899.2-1.599.3-1.998.3-.6 0-1.6-.4-3.1-1.1a23.011 23.011 0 0 0-9.895-2.198c-3.599 0-7.197.7-10.596 2.199-4.498 1.999-8.197 4.798-10.996 8.496C1.6 190.226 0 194.924 0 200.122c0 4.498 1.3 8.696 3.898 12.795 2.7 4.498 6.198 7.697 10.796 9.696zm38.585-35.386c1.3.8 2.1 2 2.5 3.598.3 1.6.499 5.298.499 10.996 0 5.598-.2 9.896-.6 12.995-.2 1.8-.8 2.899-1.7 3.299-.999.4-1.598.8-1.898 1.1-.3.3-.4.7-.4 1.299 0 .7.3 1.4.8 2 .5.599 1.199 1.099 2.099 1.399 1.799.7 4.998 1 9.496 1 3.998 0 6.797-.3 8.497-.8.9-.3 1.599-.7 2.199-1.3.5-.6.8-1.3.8-2.1 0-.599-.1-1.099-.4-1.399-.3-.3-.9-.7-1.7-1.1-1-.4-1.799-1.099-1.899-1.898-.2-.8-.4-3.7-.4-8.697v-11.296c0-3.498.4-7.297.7-11.495.2-2.7.5-4.398.5-5.198 0-2.3-.9-3.399-2.7-3.399-1.199 0-2.998.2-5.597.7-2.599.4-4.598.9-6.298 1.4-2.399.7-4.198 1.499-5.297 2.398-1.1.9-1.6 1.9-1.6 3 0 .699.2 1.299.5 1.799.3.6 1 1.2 1.9 1.699zm42.783 37.985c5.698 0 10.796-1.7 15.295-5.098 4.698-3.599 6.997-7.897 6.997-12.895 0-2.899-.7-5.698-2.2-8.397-1.399-2.599-3.298-4.598-5.597-6.197-3.199-2.2-6.997-3.299-11.296-3.299-6.097 0-11.395 1.8-15.694 5.498-4.098 3.499-6.197 7.997-6.197 13.495 0 4.998 1.7 8.996 4.998 12.095 3.598 3.199 8.197 4.798 13.694 4.798zm-1.999-26.69c.6-.8 1.4-1.1 2.5-1.1 1.399 0 2.498.9 3.198 2.5.7 1.6 1.4 3.599 1.9 6.098.5 2.499.799 4.698.799 6.697 0 2.599-1 3.998-3.099 3.998-1.6 0-2.799-1-3.498-2.899-.7-1.899-1.4-3.998-1.9-6.397-.5-2.4-.8-4.298-.8-5.698 0-1.4.3-2.399.9-3.199zm54.579 26.09c.4.3 1.2.4 2.299.4 2.699 0 5.598-.3 8.497-1 4.998-1.1 7.497-2.798 7.497-4.898 0-1.1-.4-1.899-1.5-2.499-1.4-.7-1.799-1.4-1.799-2.199v-15.494c0-1.6-.2-2.999-.2-4.098 0-.8-.1-1.3-.1-1.6 0-2.499-1.2-3.798-3.598-3.798-4.199 0-8.597.5-12.895 1.6-2.3.6-3.499 1.599-3.499 2.998 0 1.1.7 2 2 2.7.699.399 1.099.699 1.299.899.2.3.4.7.5 1.3.3 1.399.4 3.998.4 7.896 0 3.899-.3 6.398-.8 7.497-.3.6-.7 1-1.4 1.4-.7.4-1.3.6-1.999.6-2.699 0-3.998-2-3.998-6.098v-18.993c0-1.2-.7-1.799-2.1-1.799-4.598 0-9.196.5-13.794 1.5-2.7.6-3.999 1.799-3.999 3.498 0 .5.1.9.4 1.2.2.3.8.7 1.7 1.1 1 .499 1.499 1.299 1.899 2.198.4.9.5 2.4.5 4.399v6.497c0 5.098.8 8.797 2.399 10.996 1.799 2.599 4.998 3.898 9.496 3.898 2.699 0 5.298-.8 7.597-2.399 1.2-.8 1.9-1.3 2.1-1.4.2-.1.499-.2.799-.2.8 0 1.2.7 1.3 2.2.3 1 .6 1.5.999 1.7zm26.29-3.398c2.899 2.699 6.197 3.998 9.796 3.998 2.899 0 5.598-1 7.997-2.899.8-.7 1.5-1.1 1.899-1.1.7 0 1.1.6 1.3 1.8.1.8.2 1.4.4 1.6.2.2.699.3 1.499.3 3.398 0 6.797-.4 10.196-1.3 3.798-1 5.598-2.4 5.598-4.299 0-.6-.1-1.2-.4-1.599-.3-.4-.9-1-1.7-1.5-.7-.5-1.599-1-1.699-1.499-.2-.5-.7-1.7-.7-3.499V179.23c0-1.9-.6-2.899-2.599-2.899s-5.797.8-11.795 2.5c-3.399.999-4.998 2.298-4.998 3.998 0 1.2.8 1.999 2.299 2.499 1.1.3 1.8.7 2.2 1.2.399.499.599 1.099.599 1.998 0 2-.4 3-1.1 3-.2 0-.5-.1-.8-.3-2.099-1.2-4.598-1.8-7.297-1.8-2.399 0-4.798.6-7.197 1.9-2.899 1.499-5.198 3.698-6.897 6.497-1.8 3.099-2.699 6.197-2.699 9.496 0 2.799.7 5.598 2.1 8.297.899 2.099 2.298 3.998 3.998 5.598zm12.295-21.892c.9-1.6 2.099-2.399 3.598-2.399 1.2 0 2.1.5 2.8 1.5.8 1.199 1.199 3.598 1.199 7.197 0 3.898-.3 6.797-1 8.496-.7 1.8-1.799 2.6-3.298 2.6-1.4 0-2.5-.6-3.3-1.8-1.099-1.6-1.698-3.998-1.698-7.197-.1-3.499.5-6.298 1.699-8.397zm43.283 16.994c1.3-.1 2.1-.2 2.399-.2.9 0 1.4.4 1.4 1.3 0 1.099-.6 2.598-1.7 4.397-1.2 2-2.699 3.499-4.398 4.599-1.4.9-2.1 1.599-2.1 2.099 0 .7 1.1 1.7 3.4 2.899 2.198 1.2 4.098 1.799 5.497 1.799.8 0 1.8-.4 2.999-1.3 4.998-3.698 9.296-8.696 12.995-14.894 3.299-5.598 4.998-10.995 4.998-16.093 0-6.298-2.499-10.896-7.597-13.795-3.899-2.1-8.097-3.199-12.795-3.199-5.798 0-10.696 1.5-14.694 4.398-3.799 2.7-5.698 6.598-5.698 11.596 0 2.499.5 4.898 1.4 7.197.899 2.3 2.298 4.298 3.998 5.898 2.299 2.199 5.298 3.199 8.996 3.199.4.2.7.2.9.1zm2-20.992c.699-.8 1.499-1.3 2.498-1.3 1.1 0 2.1.5 2.999 1.5.7.8 1.3 1.999 1.8 3.598.5 1.6.799 2.999.799 4.299 0 1.1-.3 1.999-.9 2.698-.6.7-1.4 1.1-2.299 1.1-1.6 0-2.999-.9-4.198-2.599-1.2-1.7-1.8-3.798-1.8-6.198.1-1.199.5-2.199 1.1-3.098zm8.496-128.05a51.195 51.195 0 0 0-50.18-13.095C187.825 23.79 162.135 0 131.048 0c-28.789 0-52.88 20.292-58.677 47.381-18.993-6.097-40.584-1.599-55.679 13.495-21.491 21.492-21.491 56.278 0 77.77 17.794 17.793 43.783 22.89 57.278 22.89H179.03c20.392.1 42.483-2.198 61.876-21.49 20.092-20.193 20.092-52.68.1-72.772zm-85.567 43.283c-3.998 6.797-18.393 28.089-25.39 28.089-3.698 0-17.293-6.798-17.293-11.596 0-1.699 1.9-3.498 2.899-4.098 6.297-4.098 13.195-16.094 13.195-22.691 0-2.2-1.2-3.099-2.8-3.099-2.098 0-4.298.5-6.397.5-19.292 0-28.189-20.892-28.189-39.685 0-26.49 20.592-38.585 39.385-38.585 19.992 0 40.184 12.296 40.184 40.185 0 19.092-6.697 35.986-15.594 50.98zm-25.59-66.774c-4.398 0-6.797 5.798-6.797 10.796 0 8.296 3.698 21.391 11.595 21.391 4.099 0 6.298-4.598 6.298-9.296-.1-7.097-3.399-22.891-11.096-22.891z"/>
</svg>
EOF
}