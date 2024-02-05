pipeline{
tools{
jdk 'myjava'
maven 'mymaven'
}
agent any
stages{
stage('Clone Repo')
{
steps{
git 'https://github.com/desbain/devops-basics.git'
}
}
stage('Compile the code')
{
steps{
sh 'mvn compile'
}
}
stage('Code Analysis')
{
steps{
sh 'mvn pmd:pmd'
}
}
stage('code coverage')
{
steps{
sh 'mvn cobertura:cobertura -Dcobertura.report.format=xml'
}
}
stage('Build the artifact')
{
steps{
sh 'mvn package'
}
}
}
}
