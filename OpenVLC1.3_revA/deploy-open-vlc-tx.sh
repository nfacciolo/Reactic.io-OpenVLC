#!/bin/bash

printf "\nExecuting deploy-open-tx.sh"

cd PRU/TX || exit
chmod +x ./deploy.sh || exit
./deploy.sh || exit