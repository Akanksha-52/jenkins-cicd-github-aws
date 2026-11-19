
# Jenkins CI/CD Pipeline Architecture

## Project Overview

This project automates website deployment using Jenkins, GitHub, and AWS EC2.

Two EC2 instances are used:

1. Jenkins Server
2. Apache Web Server

## Architecture Components

### 1. GitHub
- Stores the website source code.
- Contains the index.html file.
- Sends webhook notifications when code is pushed.

### 2. Jenkins Server
- Runs Jenkins.
- Receives GitHub webhook notifications.
- Downloads the latest code.
- Executes the deployment pipeline.
- Transfers website files using SCP.

### 3. Apache Web Server
- Runs Apache on Ubuntu.
- Receives website files from Jenkins.
- Hosts the website from /var/www/html.
- Displays the updated website.

## Deployment Workflow

1. Developer updates index.html.
2. Developer pushes changes to GitHub.
3. GitHub sends a webhook notification to Jenkins.
4. Jenkins starts a new pipeline build.
5. Jenkins downloads the latest repository contents.
6. Jenkins transfers index.html to the Apache Web Server using SCP.
7. Apache serves the updated website.

## Network and Security

- SSH port 22 is used for server administration and deployment.
- Jenkins dashboard uses port 8080.
- HTTP port 80 is used to access the website.
- SSH communication between Jenkins and the Web Server uses key-based authentication.
- Security groups should restrict access to trusted sources.

## Expected Result

Whenever a developer pushes updated website code to GitHub, Jenkins automatically deploys the latest version to the Apache Web Server.

Manual file copying is not required.
