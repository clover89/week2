node {
    checkout scm
    stage('Build') {
        echo 'Building..'
        sh 'npm install'
    }
    stage('Test') {
        echo 'Testing..'
        sh 'npm run testJenkins'
    }
    stage('Deploy') {
        # Jenkins GitHub Plugin has a GIT_COMMIT environment variable set for you.
        # ./provision-new-environment.sh
    }
}
