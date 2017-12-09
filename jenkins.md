# ***Jenkins - Instantiation & Installation***

> This document describes the steps that were taken to instantiate my AWS machine and getting Jenkins running and ready to perform continuous integration, building, testing
as well as continuous deployment.

## Using the scripts
> I initially started out using the scripts provided. I followed the steps given, like creating IAM instance profile, role and policy (I have my own AWS account). I tried to modify the scripts appropriately but it proved to be troublesome as there was some discrepancy between them and the functions.

> Later in the day a new option was given for those having problems: instantiation manually via AWS web console. So I did.


## The instantiation procedure

> The progress was as follows:
  * Logged into AWS console
  * Clicked "Launch instance"
  * Chose Amazon Linux AMI 64-bit machine
  * Chose instance type t2.micro
  * Left details, storage and tag with their default settings
  * Created a security group with the following inbound rules:
    - HTTP, port 80, source 0.0.0.0 (don't worry, Jenkins is password protected)
    - Custom TCP rule, port 8080
    - SSH, port 22
  * Created a key in order to access instance via SSH
  * Configuration complete -> Launched instance

## Instance info

> Aside from the configurations set in the steps above this info should be noted as well:
  * Instance ID: i-0dacd0ad36ead8485
  * AMI ID: amzn-ami-hvm-2017.09.1.20171120-x86_64-gp2 (ami-15e9c770)
  * Region: us-east-2
  * Public DNS: ec2-52-14-66-207.us-east-2.compute.amazonaws.com (add :8080 to visit)
  * Public IP: 52.14.66.207
  * VPC ID: vpc-ea7f9682
  * IAM Role: StudentCICDServer
  * Security group: HGOP_Jenkins_SECGROUP
  * Key-pair: HGOP_Pair

## Installing the software

> In order to set up Jenkins on the newly provisioned instance the following steps were taken:
> * I logged into my machine
    * $ ssh -i HGOP_Pair.pem ec2-user@52.14.66.207
> * In order to run Jenkins Java had to be updated to version 8
    * $ sudo yum install java-1.8.0
    * $ sudo yum remove java-1.7.0-openjdk
> * Downloaded and installed Jenkins
    * $ sudo yum update
    * $ sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
    * $ sudo rpm --import http://pkg.jenkins-ci.org/redhat-stable/jenkins-ci.org.key
    * $ sudo yum install jenkins
    * $ sudo service jenkins start
    * $ sudo chkconfig jenkins on
> * Logged in as Jenkins user
    * $ sudo su -s /bin/bash jenkins
> * Entered Jenkins home directory and generated SSH key for Github so that it knows that this a trusted machine
    * $ cd /var/lib/jenkins/
    * $ ssh-keygen
    * $ cat .ssh/id_rsa.pub
> * Restart instance
    * $ sudo reboot

## Configuring Jenkins

> Open Jenkins WEB UI console in Browser
> * ec2-52-14-66-207.us-east-2.compute.amazonaws.com:8080
    * User name: clover89
    * Password: *See Canvas submission comment*

> * Go to Manage Jenkins > Setup security and check
    * Enable Security
    * Logged-in users can do anything

## Other installations

> Aside from the steps above the following had to done on the instance:
> * Install docker-compose
> * Log into docker
> * Make sure all info about production instance is kept safely
> * Grant permission to run AWS CLI commands

## The pipeline

> To define the workflow of my pipeline a so-called Jenkinsfile had to be created.
> It is used to glue together all the necessary steps included in producing the software. That is building, testing and deploying. See Jenkinsfile in project root.

> Creating the Jenkins project from the Web UI console
  * Create new project
  * Pick pipeline project type
  * Under configure go to Pipeline
  * Set Definition as Pipeline script from SCM
  * As SCM choose Git
  * Add your repository URL
    * Go to repo and click 'Clone using SSH', copy to clipboard
  * Create new credentials:
    * Kind: SSH Username with private key
    * Add Github username
    * Add Github password if you have one
    * Set Private Key as From the Jenkins master ~/.ssh

> After successfully finishing the above steps the project should be manually buildable. The final step is automation using Webhook. See below.

## Webhook

> Webhook is deployment trigger. Using Webhook, Jenkins detects changes to our master branch on Github and pulls them and runs the building process defined in the Jenkinsfile. The following steps were made to activate Webhook:

> * Install Github integration plugin for Jenkins
> * Configure Github
>   * Settings > Integration & services > Add Service
>   * Add Jenkins (GitHub plugin)
>   * Enter Jenkins URL followed by /github-webhook/
>     * ec2-52-14-66-207.us-east-2.compute.amazonaws.com:8080/github-webhook/
> * Grant Jenkins access to repo by adding deploy SSH key to Github
>   * Log into instance as Jenkins user
>   * Go to /var/lib/jenkins/.ssh/
>   * $ ssh-keygen <key-name>.pub
>   * Make sure to give it a separate name from the key previously created
>   * Github > Repository settings > Deploy keys > Add the one you just created
> * Update Jenkins project configuration
>   * Check 'GitHub project' and enter repository URL
>   * Tell Jenkins when to build
>     * Check 'GitHub hook trigger for GITScm polling'

> Continuous integration should be achieved by now. Every time a change is made to repository master branch, it is pulled by Jenkins and integrated automatically.
> The running instance of our deployed app is there
> * http://ec2-13-58-39-80.us-east-2.compute.amazonaws.com:8080/
