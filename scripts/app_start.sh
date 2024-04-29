#!/bin/bash
sudo systemctl start apache2
aws autoscaling set-desired-capacity --auto-scaling-group-name zero-downtime-deployment-asg-name --desired-capacity 0
