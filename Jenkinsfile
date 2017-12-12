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
        echo 'Testing...'
        // Running unit tests
        echo 'Unit testing...'
        sh 'npm run testJenkins'

        // Initializing for API and load tests
        sh 'cd provisioning && docker-compose up'
        sh 'npm run startpostgres'
        sh 'npm run startserverJenkins'

        // Running API test
        echo 'Running API test...'
        sh 'npm run apitestJenkins'

        // Running load test
        echo 'Running load test...'
        sh 'npm run loadtestJenkins'
        sh 'docker-compose down'
        sh 'cd ..'
    }
    stage('Deploy') {
        echo 'Deploying...'
         // Building and pushing Docker container
         sh './dockerbuild.sh'
         // Entering provisioning folder and running provisioning scripts
         sh 'cd provisioning && ./provision-new-environment.sh'
    }
}
