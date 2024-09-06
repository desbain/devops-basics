pipeline {
    tools {
        jdk 'myjava'
        maven 'mymaven'
    }
    agent any
    stages {
        stage('Checkout') {
            agent {
                label 'master'
            }
            steps {
                echo 'Cloning...'
                git 'https://github.com/desbain/devops-basics.git'
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
                echo 'Code Review...'
                sh 'mvn pmd:pmd'
            }
        }
        stage('UnitTest') {
            agent {
                label 'slave1'  // Changed from 'slave' to 'slave1' to match other stages
            }
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
            agent {
                label 'master'
            }
            steps {
                echo 'Packaging...'
                sh 'mvn package'
            }
        }
    }
}
