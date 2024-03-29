#!/bin/bash

source /home/logan/.nvm/nvm.sh;

# View deployment logs at journalctl -S today -f -u githubDeployer.service
/home/logan/.nvm/versions/node/v17.9.0/bin/npm ci --unsafe-perm=true --allow-root
chmod +x ./start.sh
cp sbrDocumentApi.service /etc/systemd/system/sbrDocumentApi.service
systemctl stop sbrDocumentApi
systemctl daemon-reload
systemctl enable sbrDocumentApi
systemctl start sbrDocumentApi

echo $(systemctl status sbrDocumentApi)
