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