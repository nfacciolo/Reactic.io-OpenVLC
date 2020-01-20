#!/bin/bash

printf "\nExecuting deploy-open-rx.sh"

cd PRU/RX || exit
chmod +x ./deploy.sh || exit
./deploy.sh || exit