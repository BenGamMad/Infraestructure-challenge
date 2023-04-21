pipeline{
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
    } 
    agent any
    environment{
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_REGION = credentials ('AWS_REGION')
    }
    stages{
        stage('Git checkout') {
            steps {
                 script{
                        dir("terraform")
                        {
                            git "https://github.com/BenGamMad/Infraestructure-challenge.git"
                        }
                    }
                }
        }

        stage("Terraform Init"){
            steps{
                echo "========INITIALIZING========"
                sh ("terraform init")
            }
        }
        stage("Terraform Plan"){
            steps{
                sh ("terraform plan -out tfplan")
                
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
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }
       stage('Apply') {
            steps {
                sh "terraform apply -plan=tfplan"
            }
        }
    }
}