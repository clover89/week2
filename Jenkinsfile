node {
    env.NODEJS_HOME = "${tool 'recent node'}"
    checkout scm
    stage('Build') {
        echo 'Building...'
        sh 'yarn install'
        sh 'cd client && yarn install'
    }
    stage('Test') {
        echo 'Testing...'
        //sh 'npm run testJenkins'
    }
    stage('Deploy') {
        echo 'Deploying...'
        // sh './dockerbuild.sh'
        // sh 'cd provisioning && ./provision-new-environment.sh'
    }
}
