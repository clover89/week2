node {
    // Install/Use Node 6.9.1
    env.NODEJS_HOME = "${tool 'recent node'}"
    checkout scm
    stage('Clean') {
        // Clean files from last build.
        sh 'git clean -dfxq'
    }
    stage('Build') {
        echo 'Building...'
        // Install server dependencies
        sh 'yarn install'
        // Install client dependencies
        sh 'cd client && yarn install'
    }
    stage('Test') {
        // Running unit tests
        echo 'Testing...'
        sh 'npm run testJenkins'
    }
    stage('Deploy') {
        echo 'Deploying...'
         // Building and pushing Docker container
         sh './dockerbuild.sh'
         // Entering provisioning folder and running provisioning scripts
         sh 'cd provisioning && ./provision-new-environment.sh'
    }
}
