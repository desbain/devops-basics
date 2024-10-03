pipeline {
    tools {
        jdk 'myjava'
        maven 'mymaven'
    }
    agent any
    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning repository...'
                // Clone the private GitHub repository using the provided credentials
                git credentialsId: 'desbain', url: 'https://github.com/desbain/devops-basics.git'
            }
        }
        stage('Compile') {
            steps {
                echo 'Compiling...'
                sh 'mvn compile'
            }
        }
        stage('CodeReview') {
            steps {
                echo 'Performing code review...'
                sh 'mvn pmd:pmd'
            }
        }
        stage('Package') {
            steps {
                echo 'Packaging...'
                sh 'mvn package'
            }
        }
    }
}
