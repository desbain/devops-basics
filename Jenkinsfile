pipeline {
    tools {
        jdk 'myjava'
        maven 'mymaven'
    }
    agent any

    stages {
        stage('Checkout') {
            agent {
                label 'master'  // Changed 'Master' to 'master' for case consistency
            }
            steps {
                echo 'Cloning repository...'
                git 'https://github.com/desbain/devops-basics.git'  // Removed the double "https://"
            }
        }
        stage('Compile') {
            agent {
                label 'slave1'
            }
            steps {
                echo 'Compiling...'
                sh 'mvn compile'
            }
        }
        stage('CodeReview') {
            agent {
                label 'slave1'
            }
            steps {
                echo 'Running code review...'
                sh 'mvn pmd:pmd'
            }
        }
        stage('UnitTest') {
            agent {
                label 'slave1'
            }
            steps {
                echo 'Running unit tests...'
                sh 'mvn test'
            }
            post {
                success {
                    junit 'target/surefire-reports/*.xml'
                }
            }
        }
        stage('Package') {
            agent {
                label 'master'  // Changed 'Master' to 'master' for case consistency
            }
            steps {
                echo 'Packaging application...'
                sh 'mvn package'
            }
        }
    }
}
