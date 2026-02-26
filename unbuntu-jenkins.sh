# Update system
sudo apt update
sudo apt upgrade -y

# Install required packages
sudo apt install curl gnupg2 ca-certificates lsb-release -y

# Install Java (Required for Jenkins)
sudo apt install openjdk-17-jdk -y

# Verify Java
java -version

# Remove old Jenkins configs (if any)
sudo rm -f /etc/apt/sources.list.d/jenkins.list
sudo rm -f /usr/share/keyrings/jenkins-keyring.asc

# Import Jenkins GPG Key
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 7198F4B714ABFC68

# Add Jenkins repository
echo "deb https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list

# Update package list
sudo apt update

# Install Jenkins
sudo apt install jenkins -y

# Start Jenkins
sudo systemctl start jenkins

# Enable Jenkins on boot
sudo systemctl enable jenkins

# Check status
sudo systemctl status jenkins

# Allow port 8080 (if firewall enabled)
sudo ufw allow 8080
sudo ufw enable

# Get initial admin password
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
