node {
    // Install/Use Node 6.9.1
    env.NODEJS_HOME = "${tool 'recent node'}"
    checkout scm
    stage('Clean') {
        // Clean files from last build.
        sh 'git clean -dfxq'
        sh 'cd provisioning && /usr/local/bin/docker-compose down --rmi all -v'
        sh 'cd ..'
    }
    stage('Setup') {
        echo 'Building...'
        // Install server dependencies
        sh 'yarn install'
        // Install client dependencies
        sh 'cd client && yarn install'
    }
    stage('Unit test') {
      // Running unit tests
      echo 'Unit testing...'
      sh 'npm run testJenkins'
    }
    stage('Build') {
        // Building and pushing Docker container
        sh './dockerbuild.sh'
        GIT_COMMIT = sh( script: 'git rev-parse HEAD', returnStdout: true )
        sh 'cd provisioning && /usr/local/bin/docker-compose up -d'
    }

    stage('API test and load test') {
        // Initializing for API and load tests
        sh 'npm run startpostgres'
        sh 'npm run startserverJenkins'

        // Running API test
        echo 'Running API test...'
        sh 'npm run apitestJenkins'

        // Running load test
        echo 'Running load test...'
        sh 'npm run loadtestJenkins'
        sh '/usr/local/bin/docker-compose down'
        sh 'cd ..'
    }
    stage('Deploy') {
        echo 'Deploying...'
       // Entering provisioning folder and running provisioning scripts
       sh 'cd provisioning && ./provision-new-environment.sh'
    }
}
