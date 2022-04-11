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
                    sh 'cat output.txt | tail -2 | head -2 | cut -d : -f2 > ami.txt'
                    sh 'cat ami.txt'
                    script {
                        def amigenerated = sh (script: 'cat ami.txt')
                        echo "projectami = \"$amigenerated\"" >> /var/lib/jenkins/workspace/project/dockerinstancewithpackerami/variables.tfvars
                    }
                }
            }
        }
    }
}
