#!/bin/bash

if [[ $# -ne 2 ]] || [[ "$1" == '' || "$2" == '' ]]; then
  echo "Usage: $(basename $0) <playbook> <inventory_file>"
  exit 1
fi

PLAYBOOK=$1
INVENTORY_FILE=$2

#sudo ansible-playbook "$PLAYBOOK" -i "$INVENTORY_FILE" --connection=local
sudo ansible-playbook "$PLAYBOOK" --connection=local
