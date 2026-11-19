# Automated CI/CD Pipeline Using Jenkins, GitHub, and AWS EC2

## 1. Project Overview

The objective of this project is to automate website deployment whenever code is updated in GitHub.

When a developer modifies the website's HTML file and pushes the changes to GitHub, Jenkins automatically downloads the updated code and deploys it to an AWS EC2 web server.

Apache serves the updated website without requiring manual file copying.

## 2. Project Objectives

- Set up a Jenkins server on AWS EC2.
- Host a website using Apache on a separate EC2 instance.
- Connect Jenkins with a GitHub repository.
- Configure secure SSH communication between the servers.
- Automate website deployment using a Jenkins pipeline.
- Configure a GitHub webhook to trigger builds automatically.
- Verify automatic deployment after code changes.

## 3. Technologies and Services Used

| Technology | Purpose |
|---|---|
| AWS EC2 | Provides cloud servers |
| Ubuntu Linux | Operating system |
| Java | Required to run Jenkins |
| Jenkins | Automates the CI/CD pipeline |
| Git and GitHub | Source code management |
| Apache | Hosts the website |
| SSH | Secure connection between servers |
| SCP | Transfers website files |
| GitHub Webhook | Triggers Jenkins after code changes |
| Security Groups | Controls network access |

## 4. Project Architecture

This project uses two AWS EC2 instances:

**1. Jenkins Server**
- Runs Jenkins.
- Connects to GitHub.
- Downloads updated website code.
- Executes the deployment pipeline.
- Connects to the web server using SSH.

**2. Web Server**
- Runs Apache.
- Receives website files from Jenkins.
- Hosts the website.
- Displays the updated website to visitors.

## 5. How the CI/CD Pipeline Works

1. Developer updates the website code in GitHub.
2. Developer pushes the changes to the repository.
3. GitHub sends a webhook notification to Jenkins.
4. Jenkins automatically starts a new build.
5. Jenkins downloads the latest code from GitHub.
6. Jenkins transfers `index.html` to the web server using SCP.
7. The updated file is copied into Apache's document directory.
8. Apache serves the updated website.

## 6. Implementation Steps

### Step 1: Create Two AWS EC2 Instances

Launch two Ubuntu EC2 instances:

- Jenkins Server
- Apache Web Server

Configure appropriate security groups for SSH, Jenkins dashboard access, and HTTP traffic.

### Step 2: Install Java and Jenkins

Install Java and Jenkins on the Jenkins Server.

Start and enable the Jenkins service, then access the Jenkins dashboard using:

`http://JENKINS_SERVER_PUBLIC_IP:8080`

Complete the initial Jenkins setup.

### Step 3: Install Apache

Run the following commands on the Web Server:

```bash
sudo apt update
sudo apt install apache2 -y
sudo systemctl enable --now apache2
```

Verify Apache by opening the web server's public IP address in a browser.

### Step 4: Create a GitHub Repository

Create a GitHub repository and add an `index.html` file containing the sample website.

### Step 5: Configure Jenkins

Open the Jenkins dashboard and create a new Pipeline job.

Test the pipeline with a simple script and verify that the build completes successfully.

### Step 6: Connect Jenkins to GitHub

Configure the pipeline to download code from the GitHub repository.

Verify that Jenkins successfully downloads the website files.

### Step 7: Configure SSH Between Servers

Generate an SSH key for the Jenkins user and authorize its public key on the Web Server.

Test the SSH connection to ensure Jenkins can connect to the Web Server without an interactive password prompt.

**Important:** Keep the private SSH key on the Jenkins server. Never upload it to GitHub.

### Step 8: Configure Automatic Deployment

Update the Jenkins pipeline to:

- Pull the latest website code from GitHub.
- Transfer `index.html` using SCP.
- Copy the file into Apache's document directory on the Web Server.

### Step 9: Configure GitHub Webhook

Configure the GitHub push trigger in Jenkins.

Add a webhook in the GitHub repository settings so that a push event triggers a new Jenkins build.

### Step 10: Test the Complete Pipeline

1. Modify the heading in `index.html`.
2. Commit and push the changes to GitHub.
3. Check whether Jenkins automatically starts a new build.
4. Verify that the deployment stage succeeds.
5. Open the Web Server's public IP address.
6. Confirm that the updated website is displayed.

## 7. Expected Result

Whenever the website code is updated and pushed to GitHub:

- Jenkins automatically detects the change through the webhook.
- Jenkins downloads the latest code.
- The pipeline deploys the updated website to the AWS Web Server.
- Apache displays the latest version of the website.

This eliminates the need to manually copy website files to the server.

## 8. Repository Structure

```text
jenkins-cicd-github-aws/
│
├── README.md
├── website/
│   └── index.html
├── jenkins/
│   └── Jenkinsfile
├── scripts/
│   ├── install-jenkins.sh
│   └── install-apache.sh
├── architecture/
│   └── architecture.md
└── screenshots/
```

## 9. Screenshots

Screenshots demonstrating the implementation will be added here.

Recommended screenshots:

- AWS EC2 instances
- Jenkins dashboard
- Apache default website
- GitHub repository
- Jenkins pipeline configuration
- Successful Jenkins build
- GitHub webhook configuration
- Updated website after automatic deployment

## 10. Security Considerations

- Do not upload private SSH keys, AWS access keys, or passwords.
- Use placeholders instead of real public IP addresses and account identifiers in documentation.
- Restrict SSH access to trusted IP addresses.
- Restrict Jenkins dashboard access to trusted IP addresses.
- Grant only the permissions required for deployment.
- Protect the Web Server's Apache document directory with appropriate ownership and permissions.

## 11. Skills Learned

- AWS EC2 instance management
- Linux administration
- Jenkins installation and configuration
- Git and GitHub
- CI/CD pipeline creation
- SSH key authentication
- SCP file transfer
- Apache web server configuration
- GitHub webhook integration
- Automated application deployment

## 12. Conclusion

This project demonstrates how Jenkins, GitHub, and AWS EC2 can work together to automate website deployment.

By implementing a CI/CD pipeline, website updates can be deployed automatically whenever changes are pushed to GitHub. This reduces manual work and demonstrates an important DevOps automation workflow.

---

**Project:** Automated CI/CD Pipeline Using Jenkins, GitHub, and AWS EC2  
**Category:** AWS | DevOps | CI/CD | Automation
