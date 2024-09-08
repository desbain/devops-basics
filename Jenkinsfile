
pipeline {
    tools {
        jdk 'myjava'
        maven 'mymaven'
    }
    agent any
    stages {
        stage('Checkout') {
            steps {
                echo 'Cloning...'
                git 'https://github.com/desbain/devops-basics.git'
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
                echo 'Code Review...'
                sh 'mvn pmd:pmd'
            }
        }
        stage('UnitTest') {
            steps {
                echo 'Testing...'
                sh 'mvn test'
            }
            post {
                success {
                    junit 'target/surefire-reports/*.xml'
                }
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
