pipeline {
    agent any

    tools {
        // Install the Maven version configured in Jenkins
        maven 'Maven 3.6.3' // or whatever name you gave to your Maven installation in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                git 'https://github.com/JagadeeshMusham/GitHubProject' // Replace with your repository URL
            }
        }

        stage('Build') {
            steps {
                // Run Maven to build the project
                sh 'mvn clean compile'
            }
        }

        stage('Test') {
            steps {
                // Run Maven to test the project
                sh 'mvn test'
            }
        }

        stage('Package') {
            steps {
                // Run Maven to package the project
                sh 'mvn package'
            }
        }
    }

    post {
        success {
            echo 'Build and tests succeeded.'
        }
        failure {
            echo 'Build or tests failed.'
        }
    }
}


//pipeline {
//  agent {
//    docker { image 'node:16-alpine' }
//  }
//  stages {
//    stage('Test') {
//      steps {
//        sh 'node --version'
//      }
//    }
//  }
//}
