pipeline {
    agent any

    tools {
        // Install the Maven version configured in Jenkins
        maven 'Maven 3.8.7' // or whatever name you gave to your Maven installation in Jenkins
    }

    stages {
        stage('Checkout') {
            steps {
                // Checkout the code from the Git repository
                git 'https://github.com/JagadeeshMusham/GitHubProject' // Replace with your repository URL
            }
        }

        stage('OWASP SCAN') {
            steps {
                dependencyCheck additionalArguments: ' --scan ./', odcInstallation: 'DP'
                 dependencyCheckPublisher pattern: '**/dependency-check-report.xml'
            }
        }

        stage('Build') {
            steps {
                // Run Maven to build the project
                sh 'mvn clean install'
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

        stage('Build and push Docker Image') {
            steps {
                script {
                    // This step should not normally be used in your script. Consult the inline help for details.
                    withDockerRegistry(credentialsId: '5a8cd214-58e1-4c27-a8b0-7c6a8f78f291', toolName: 'docker') {
                        sh "docker build -t shopping:latest -f docker/Dockerfile ."
                        sh "docker tag shopping:latest admin/shopping:latest"
                        sh "docker push admin/shopping:latest"
                    }
                }
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
