#/bin/bash

     wget https://github.com/prometheus/prometheus/releases/download/v2.22.0/prometheus-2.22.0.linux-amd64.tar.gz
     tar xfz prometheus-2.22.0.linux-amd64.tar.gz
     cd prometheus-2.22.0.linux-amd64/
     sudo cp ./prometheus /usr/local/bin/
     sudo cp ./promtool /usr/local/bin/
     sudo chown prometheus:prometheus /usr/local/bin/prometheus
     sudo chown prometheus:prometheus /usr/local/bin/promtool
     sudo cp -r ./consoles /etc/prometheus
     sudo cp -r ./console_libraries /etc/prometheus
     sudo chown -R prometheus:prometheus /etc/prometheus/consoles
     sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
     cd ..
     rm -rf prometheus-2.22.0.linux-amd64
     rm prometheus-2.22.0.linux-amd64.tar.gz

     # Necessary to fill up port of prometheus in prometheus.yml, af far as cadvisor port according to install_cadvisor.sh
     sudo cp ./prometheus.yml /etc/prometheus/prometheus.yml
     sudo chown prometheus:prometheus /etc/prometheus/prometheus.yml
     sudo cp ./prometheus.service /etc/systemd/system/prometheus.service
     sudo systemctl daemon-reload
     sudo systemctl enable prometheus
     sudo systemctl start prometheus
     sudo systemctl status prometheus
