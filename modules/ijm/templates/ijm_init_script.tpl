#!/bin/sh
yum install -y git docker
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
service docker start
cd /tmp
sudo wget https://s3.amazonaws.com/amazoncloudwatch-agent/amazon_linux/amd64/latest/amazon-cloudwatch-agent.rpm
sudo rpm -U /tmp/amazon-cloudwatch-agent.rpm


cat <<EOF > /opt/aws/amazon-cloudwatch-agent/etc/amazon-cloudwatch-agent.json
{
    "agent": {
        "metrics_collection_interval": 30,
        "region": "eu-west-2",
        "logfile": "/opt/aws/amazon-cloudwatch-agent/logs/amazon-cloudwatch-agent.log"
    },
    "metrics": {
        "namespace": "ijm-dev",
        "metrics_collected": {
            "cpu": {
                "resources": [
                    "*"
                ],
                "measurement": [
                    {"name": "cpu_usage_idle", "rename": "CPU_USAGE_IDLE", "unit": "Percent"},
                    {"name": "cpu_usage_nice", "unit": "Percent"},
                    "cpu_usage_guest"
                ],
                "totalcpu": false,
                "metrics_collection_interval": 30
            },
            "mem": {
                "measurement": [
                    "mem_used",
                    "mem_cached",
                    "mem_total"
                ],
                "metrics_collection_interval": 30
            },
            "netstat": {
                "measurement": [
                    "tcp_established",
                    "tcp_syn_sent",
                    "tcp_close"
                ],
                "metrics_collection_interval": 60
            },
            "disk": {
                "measurement": [
                    "used_percent"
                ],
                "resources": [
                    "*"
                ],
                "drop_device": true
            },  
            "processes": {
                "measurement": [
                    "running",
                    "sleeping",
                    "dead"
                ]
            }
        }   
    }
}
EOF 
