#!/bin/bash
set -euo pipefail

getent group devteam || sudo groupadd devteam
id devuser1 &>/dev/null || sudo useradd -m -s /bin/bash devuser1
id devuser2 &>/dev/null || sudo useradd -m -s /bin/bash devuser2

sudo usermod -aG devteam devuser1
sudo usermod -aG devteam devuser2

sudo mkdir -p /opt/devproject
sudo chown root:devteam /opt/devproject
sudo chmod 770 /opt/devproject

mkdir -p ./test-files
echo 'secret' > ./test-files/config.txt
chmod 600 ./test-files/config.txt
echo 'public' > ./test-files/README.md
chmod 644 ./test-files/README.md

echo 'Done. Verifying...'
id devuser1
ls -la ./test-files/
