node {
    // Install/Use Node 6.9.1
    env.NODEJS_HOME = "${tool 'recent node'}"
    checkout scm
    stage('Clean') {
        // Clean files from last build.
        sh 'git clean -dfxq'
    }
    stage('Setup') {
        echo 'Building...'
        // Install server dependencies
        sh 'yarn install'
        // Install client dependencies
        sh 'cd client && yarn install'
    }
    stage('Build') {
        // Building and pushing Docker container
        sh './dockerbuild.sh'
    }
    stage('Test') {
        echo 'Testing...'
        //// Running unit tests
        echo 'Unit testing...'
        sh 'npm run testJenkins'

        // Initializing for API and load tests
        //sh 'npm run startpostgres'
        //sh 'npm run startserver'

        // Running API test
        //echo 'Running API test...'
        //sh 'npm run apitest'

        // Running load test
        //echo 'Running load test...'
        //sh 'npm run loadtest'
    }
    stage('Deploy') {
        echo 'Deploying...'
         // Entering provisioning folder and running provisioning scripts
         sh 'cd provisioning && ./provision-new-environment.sh'
    }
}
