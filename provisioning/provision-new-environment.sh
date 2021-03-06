#!/bin/bash

if [ -z "$GIT_COMMIT" ];
then
    export GIT_COMMIT=$(git rev-parse HEAD)
fi

# If dir exists, instance is running. Update only.
# Else create new environment and update.
if [ ! -d ~/ec2_instance/ ]; then
  echo No instance detected, provisioning...
  source ./create-aws-docker-host-instance.sh
  source ./update-env.sh ${INSTANCE_PUBLIC_NAME}
  echo New environment provisioned
else
  echo Instance already running, updating...
  INSTANCE_PUBLIC_NAME=$(cat ~/ec2_instance/instance-public-name.txt)
  source ./update-env.sh ${INSTANCE_PUBLIC_NAME}
  echo Environment updated
fi
