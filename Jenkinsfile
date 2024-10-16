pipeline {
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        booleanParam(name: 'destroy', defaultValue: false, description: 'Run terraform destroy after deployment?')
    } 
    environment {
        AWS_ACCESS_KEY_ID     = credentials('group9_access_key_id')
        AWS_SECRET_ACCESS_KEY = credentials('group9_secret_access_key')
    }

    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    dir("terraform") {
                        git url: "https://github.com/uncode1/project3b.git", branch: 'main' // Adjust branch as needed
                    }
                }
            }
        }

        stage('Plan') {
            steps {
                sh 'pwd; cd terraform; terraform init'
                sh 'pwd; cd terraform; terraform plan -out tfplan'
                sh 'pwd; cd terraform; terraform show -no-color tfplan > tfplan.txt'
            }
        }

        stage('Approval') {
            when {
                not {
                    equals expected: true, actual: params.autoApprove
                }
            }
            steps {
                script {
                    def plan = readFile 'terraform/tfplan.txt'
                    input message: "Do you want to apply the plan?", parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
                }
            }
        }

        stage('Apply') {
            steps {
                sh 'pwd; cd terraform; terraform apply -input=false tfplan'
            }
        }

        stage('Get NGINX Server IP Address') {
            steps {
                script {
                    // Fetch the NGINX public and private IP addresses from Terraform output
                    def public_ip = sh(script: 'cd terraform && terraform output -raw nginx_server_public_ip', returnStdout: true).trim()
                    def private_ip = sh(script: 'cd terraform && terraform output -raw nginx_server_private_ip', returnStdout: true).trim()

                    // Print the IP addresses to Jenkins console output
                    echo "NGINX Server Public IP: ${public_ip}"
                    echo "NGINX Server Private IP: ${private_ip}"

                    // Store public IP in the environment if needed later in the pipeline
                    env.NGINX_SERVER_PUBLIC_IP = public_ip
                }
            }
        }

        stage('Destroy') {
            when {
                equals expected: true, actual: params.destroy
            }
            steps {
                script {
                    // Confirm before destroying
                    input message: "Are you sure you want to destroy the infrastructure?", ok: "Yes, Destroy"
                }
                sh 'pwd; cd terraform; terraform destroy -auto-approve'
            }
        }
    }
    
    post {
        always {
            echo "Pipeline execution finished."
        }
    }
}
