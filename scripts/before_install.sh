#!/usr/bin/env bash

# Update the system and install necessary packages
sudo apt-get update
sudo apt-get install -y python3 python3-dev python3-pip python3-venv ruby-full wget

# Install virtualenv globally
sudo -H pip3 install --upgrade virtualenv

# Remove previous deployment directory if exists
sudo rm -rf /home/ubuntu/aws-cicd

# Clone or pull the Django application from your repository
# Replace <REPO_URL> with your actual repository URL
git clone https://github.com/shesha-sahu/aws-cicd.git /home/ubuntu/aws-cicd

# Create and activate a Python virtual environment
cd /home/ubuntu/aws-cicd
python3 -m venv venv
source venv/bin/activate

# Install Django and required dependencies
pip install -r requirements.txt

# Install AWS CodeDeploy Agent
wget https://aws-codedeploy-us-west-2.s3.us-west-2.amazonaws.com/releases/codedeploy-agent_1.3.2-1902_all.deb -P /tmp
sudo dpkg -i /tmp/codedeploy-agent_1.3.2-1902_all.deb

# Start the CodeDeploy agent service
sudo service codedeploy-agent start

# Run Django migrations and collect static files (if needed)
python manage.py migrate
python manage.py collectstatic --no-input

# Clean up temporary files if necessary
# sudo rm -rf /tmp/codedeploy-agent_1.3.2-1902_all.deb
