sudo yum update
sudo yum install ruby
sudo yum install wget
CODEDEPLOY_BIN="/opt/codedeploy-agent/bin/codedeploy-agent"
$CODEDEPLOY_BIN stop
yum erase codedeploy-agent -y
cd /home/ec2-user
wget https://bucket-name.s3.region-identifier.amazonaws.com/latest/install
chmod +x ./install
sudo ./install auto
# systemctl start codedeploy-agent
