pipeline {
tools {
jdk 'myjava'
maven 'mymaven'
}
agent any
stages {
stage('Checkout') {
steps {
echo 'cloning..'
// Use withCredentials to provide GitHub credentials
withCredentials([usernamePassword(credentialsId: 'desbain',
usernameVariable: 'USERNAME', passwordVariable: 'PASSWORD')]) {
script {
// Clone the private GitHub repository using the provided
credentials
git credentialsId: 'desbain', url:
"https://github.com/desbain/devops-basics.git"
}
}
}
}
stage('Compile') {
steps {
echo 'compiling..'
sh 'mvn compile'
}
}
stage('CodeReview') {
steps {
echo 'codeReview'
        sh 'mvn pmd:pmd'
}
        }
stage('UnitTest') {
steps {
echo 'Testing'
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
sh 'mvn package'
}
}
}
}
