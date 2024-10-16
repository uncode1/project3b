pipeline {
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
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
    }
}
