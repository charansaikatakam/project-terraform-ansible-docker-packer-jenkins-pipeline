/* groovylint-disable LineLength */
/* groovylint-disable-next-line CompileStatic */
pipeline {
    agent any
    stages {
        stage('clone the project repo') {
            steps {
                sh 'rm -rf project-terraform-ansible-docker-packer-jenkins-pipeline'
                sh 'git clone git@github.com:charansaikatakam/project-terraform-ansible-docker-packer-jenkins-pipeline.git'
            }
        }
        stage('Packer build to generate the ami to be used in next stage') {
            steps {
                sh 'pwd'
                sh 'ls -al'
                dir('packeramiwithdocker') {
                    sh 'pwd'
                    sh 'packer build packer.json 2>1 > output.txt'
                    sh 'echo \"output.txt\" | tail -2 | head -2 | cut -d : -f2 > ami.txt'
                    sh 'echo ami.txt'
                    sh 'amigenerated=$(cat ami.txt)'
                    sh 'echo \"projectami = $amigenerated\" >> /var/lib/jenkins/workspace/projectpipeline/dockerinstancewithpackerami/variables.tfvars'
                }
            }
        }
    }
}
