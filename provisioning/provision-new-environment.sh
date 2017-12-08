#!/bin/bash


if [ -z "$GIT_COMMIT" ];
then
    export GIT_COMMIT=$(git rev-parse HEAD)
fi

# If dir exists, instance is running. Updatde only.
if [ -d "ec2_instance" ]; then
  echo Instance already running, updating...
  INSTANCE_PUBLIC_NAME_=$(cat ./ec2_instance/instance-public-name.txt)
  source ./update-env.sh ${INSTANCE_PUBLIC_NAME_}
  echo Environment updated
else
  echo No instance detected, provisioning...
  source ./create-aws-docker-host-instance.sh
  source ./update-env.sh ${INSTANCE_PUBLIC_NAME}
  echo New environment provisioned
fi
