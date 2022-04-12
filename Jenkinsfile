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
 /*       stage('Packer build to generate the ami to be used in next stage') {
            steps {
                sh 'pwd'
                sh 'ls -al'
                dir('packeramiwithdocker') {
                    sh 'pwd'
                    sh 'packer build packer.json 2>1 > output.txt'
                    sh 'cat output.txt | tail -2 | head -2 | cut -d : -f2 > ami.txt'
                    sh 'cat ami.txt'
                }
            }
        } */

        stage('created ami pushing to terraformcode') {
            steps {
                /* groovylint-disable-next-line DuplicateStringLiteral */
                dir('packeramiwithdocker') {
                    script {
                        sh '''
                            amigenerated=$(cat ami.txt | cut -d " " -f 2)
                            echo '$amigenerated'
                            echo projectami = '"'$amigenerated'"' >> /var/lib/jenkins/workspace/project/dockerinstancewithpackerami/variables.tfvars
                        '''
                    }
                }
            }
        }

        stage('terraform apply') {
            steps {
                sh 'pwd'
                dir('dockerinstancewithpackerami') {
                    sh 'ls -al'
                    sh 'terraform init'
                    sh 'sleep 10'
                    sh 'terraform apply --var-file variables.tfvars --auto-approve'
                }
            }
        }

        stage('docker image creation and pushing to docker hub') {
            steps {
                dir('dockerwithansiblenginx') {
                    sh 'ls -al'
                    sh 'docker build -t charansaikatakam/project:v1 .'
                    sh 'docker push charansaikatakam/project:v1'
                }
            }
        }
    }
}
