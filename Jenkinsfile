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
                echo 'Cloning repository...'
                git 'https://github.com/desbain/devops-basics.git'
            }
        }
        stage('Compile') {
            agent {
                label 'slave1'
            }
            steps {
                dir('devops-basics') {  // Navigate to the directory where the pom.xml is located
                    echo 'Compiling...'
                    sh 'mvn compile'
                }
            }
        }
        stage('CodeReview') {
            agent {
                label 'slave1'
            }
            steps {
                dir('devops-basics') {  // Navigate to the directory where the pom.xml is located
                    echo 'Running code review...'
                    sh 'mvn pmd:pmd'
                }
            }
        }
        stage('UnitTest') {
            agent {
                label 'slave1'
            }
            steps {
                dir('devops-basics') {  // Navigate to the directory where the pom.xml is located
                    echo 'Running unit tests...'
                    sh 'mvn test'
                }
            }
            post {
                success {
                    junit 'devops-basics/target/surefire-reports/*.xml'
                }
            }
        }
        stage('Package') {
            agent {
                label 'master'
            }
            steps {
                dir('devops-basics') {  // Navigate to the directory where the pom.xml is located
                    echo 'Packaging application...'
                    sh 'mvn package'
                }
            }
        }
    }
}
