# Learn It Right Way

This project is a full-stack web application built using React.js for the frontend, Express.js for the backend, and MySQL as the database. The application follows a 3-tier architecture, separating the presentation layer (React.js), application logic layer (Express.js), and data layer (MySQL) into distinct tiers.

## User Interface Screenshots

### Dashboard  
![Dashboard](./frontend/public/ss/dashboard.png)

### Books  
![Books](./frontend/public/ss/books.png)

### Authors  
![Authors](./frontend/public/ss/authors.png)

---

## Connecting to a Private EC2 Instance via a Bastion Host

1. Change SSH key permissions:
   ```bash
   chmod 400 your_key.pem
   ```
2. Start the SSH agent:
   ```bash
   eval "$(ssh-agent -s)"
   ```
3. Add the key to SSH agent:
   ```bash
   ssh-add your_key.pem
   ```
4. SSH into the bastion host with agent forwarding:
   ```bash
   ssh -A ec2-user@bastion_host_public_ip
   ```
5. Connect to the private instance from the bastion host:
   ```bash
   ssh ec2-user@private_instance_private_ip
   ```

---

## Setting Up the Data Tier

### Install MySQL

1. Download MySQL repository package:
   ```bash
   wget https://dev.mysql.com/get/mysql80-community-release-el9-1.noarch.rpm
   ```
2. Verify the package download:
   ```bash
   ls -lrt
   ```
3. Install MySQL repository package:
   ```bash
   sudo dnf install -y mysql80-community-release-el9-1.noarch.rpm
   ```
4. Import GPG key:
   ```bash
   sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023
   ```
5. Update package index:
   ```bash
   sudo dnf update -y
   ```
6. Install MySQL server:
   ```bash
   sudo dnf install -y mysql-community-server
   ```
7. Start MySQL service:
   ```bash
   sudo systemctl start mysqld
   ```
8. Enable MySQL to start on boot:
   ```bash
   sudo systemctl enable mysqld
   ```
9. Secure MySQL installation:
   ```bash
   sudo grep 'temporary password' /var/log/mysqld.log
   sudo mysql_secure_installation
   ```
10. Create database and restore data (Refer to the [db.sql](./backend/db.sql) file).

---

## Setting Up the Application Tier

### Install Git

```bash
sudo yum update -y
sudo yum install git -y
git --version
```

### Clone Repository

```bash
git clone https://github.com/learnItRightWay01/react-node-mysql-app.git
```

### Install Node.js

1. Install Node Version Manager (nvm):
   ```bash
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
   ```
2. Load nvm:
   ```bash
   source ~/.bashrc
   ```
3. Install the latest LTS version of Node.js:
   ```bash
   nvm install --lts
   ```
4. Verify Node.js installation:
   ```bash
   node -e "console.log('Running Node.js ' + process.version)"
   ```

---

## Setting Up the Presentation Tier

### Install Git

Refer to the [Install Git](#install-git) section.

### Clone Repository

Refer to the [Clone Repository](#clone-repository) section.

### Install Node.js

Refer to the [Install Node.js](#install-nodejs) section.

### Install NGINX

```bash
dnf search nginx
sudo dnf install nginx
sudo systemctl restart nginx
nginx -v
```

### Deploy React.js Build Files

```bash
sudo cp -r dist /usr/share/nginx/html
```

### Configure NGINX

1. Set server name and root:
   ```nginx
   server_name domain.com www.subdomain.com;
   root /usr/share/nginx/html/dist;
   ```
2. Setup reverse proxy:
   ```nginx
   location /api {
       proxy_pass http://application_tier_instance_private_ip:3200/api;
   }
   ```
3. Restart NGINX:
   ```bash
   sudo systemctl restart nginx
   ```

---

## User Data Scripts

### Install NGINX (For AWS EC2 Instance)

For detailed AWS solutions, refer to: [AWS Solutions - 06](https://youtu.be/snQlL0fJI3Q) and [AWS Solutions - 07](https://youtu.be/eRX1FI2cFi8)

```bash
#!/bin/bash
# Update package lists
yum update -y

# Install Nginx
yum install -y nginx

# Stop and disable default service (optional)
systemctl stop nginx
systemctl disable nginx

# Create a custom welcome message file
echo "Welcome to Presentation Tier EC2 instance in Availability Zone B." > /usr/share/nginx/html/index.html

# Start and enable the Nginx service
systemctl start nginx
systemctl enable nginx
```

