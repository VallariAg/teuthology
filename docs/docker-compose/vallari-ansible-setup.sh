#!/bin/sh

smithi_YAML=`cat ./vallari-setup/smithi.yaml`
sepia_HOST=`cat ./vallari-setup/hosts`
ssh_pub=`cat ~/.ssh/id_rsa.pub`

echo "setting up ansible..."
docker exec docker-compose_teuthology_1 mkdir -p /etc/ansible/hosts/group_vars
# docker exec docker-compose_teuthology_1 touch /etc/ansible/hosts/group_vars/smithi.yaml
# docker exec docker-compose_teuthology_1 touch /etc/ansible/hosts/sepia
docker exec docker-compose_teuthology_1 bash -c "echo '$smithi_YAML' > /etc/ansible/hosts/group_vars/smithi.yaml"
docker exec docker-compose_teuthology_1 bash -c "echo '$sepia_HOST' > /etc/ansible/hosts/sepia"
docker exec docker-compose_teuthology_1 bash -c "echo '$ssh_pub' > ~/.ssh/id_rsa.pub"
echo "done! :)"
echo "going into docker container..."
docker exec -it docker-compose_teuthology_1 bash
