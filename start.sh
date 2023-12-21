# view only the active services
#sudo systemctl list-units --type=service --state=active
# update the system packages:
sudo yum update -y
# install the Apache HTTP Server using the following command
sudo yum install httpd -y

# install mailx, sendmail, m4
sudo yum install -y mailx
sudo yum install -y sendmail
sudo yum install m4 -y

# Start and Enable Apache Service
sudo systemctl start httpd
sudo systemctl enable httpd

# Start and enable the sendmail service
sudo systemctl start sendmail
sudo systemctl enable sendmail

# Start and Enable firewalld Service
sudo systemctl start firewalld
sudo systemctl enable firewalld

# allow HTTP and HTTPS traffic
sudo firewall-cmd --permanent --add-service=http
sudo firewall-cmd --permanent --add-service=https
sudo firewall-cmd --reload

# Reload firewalld
sudo firewall-cmd --reload

# list the services allowed in the public zone
sudo firewall-cmd --list-services --zone=public
