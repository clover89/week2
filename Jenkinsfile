node {
    checkout scm
    stage('Build') {
        echo 'Building...'
        sh 'npm install'
    }
    stage('Test') {
        echo 'Testing...'
        //sh 'npm run testJenkins'
    }
    stage('Deploy') {
        echo 'Deploying...'
        sh 'cd provisioning && ./provision-new-environment.sh'
        
    }
}
