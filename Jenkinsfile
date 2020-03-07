pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'echo "Test test"'
                sh '''
                    npm test
                '''
            }
        }
    }
}
