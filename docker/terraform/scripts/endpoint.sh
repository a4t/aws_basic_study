#!/bin/sh -e
for key in AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY; do
  if [ -z "$(eval 'echo $'$key)" ]; then
    echo Environment ${key} must setting
    exit
  fi
done

set -x

ln -sf ../../master/variables.tf terraform/scenarios/scenario${SCENARIO}/chapters/chapter${CHAPTER}/variables.tf
cd /terraform/scenarios/scenario${SCENARIO}/chapters/chapter${CHAPTER}

/usr/bin/terraform $@ -state=/terraform/master/terraform.tfstate
