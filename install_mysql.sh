#!/usr/bin/env bash

# Update the package index
sudo yum -y update

# Add the MySQL Yum repository
sudo rpm -Uvh https://repo.mysql.com/mysql80-community-release-el7-5.noarch.rpm

# Import the MySQL GPG key
sudo rpm --import https://repo.mysql.com/RPM-GPG-KEY-mysql-2023

# Install MySQL server
sudo yum --enablerepo=mysql80-community install -y mysql-community-server

# Start MySQL server
sudo systemctl start mysqld

# Enable MySQL to start on boot
sudo systemctl enable mysqld

# Get the temporary password for MySQL root user
sudo grep 'temporary password' /var/log/mysqld.log
