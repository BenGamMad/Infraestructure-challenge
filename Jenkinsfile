pipeline{
    parameters {
        booleanParam(name: 'autoApprove', defaultValue: false, description: 'Automatically run apply after generating plan?')
        choice (name: 'ACTION', choices: [ 'plan', 'apply', 'destroy'], description: 'Run terraform plan / apply / destroy')
    } 
    agent any
    environment{
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_REGION = credentials ('AWS_REGION')
        ACTION = "${params.ACTION}"
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
                sh ("terraform show -no-color tfplan > tfplan.txt")
            }
           
        }
        /*stage('Approval') {
           when {

                not {
                    equals expected: true, actual: params.autoApprove
                }
           }

           steps {
               script {
                    def plan = readFile 'tfplan.txt'
                    input message: "Do you want to apply the plan?",
                    parameters: [text(name: 'Plan', description: 'Please review the plan', defaultValue: plan)]
               }
           }
       }*/
       stage('Apply') {
            when { 
                not{
                    environment name: 'ACTION', value: 'apply'
                }
            }
            steps {
                script{
                    def IS_APPROVED = input(
						message: "Apply Develop Env !?!",
						ok: "Yes",
						parameters: [
							string(name: 'IS_APPROVED', defaultValue: 'No', description: 'Check the plan!!!')
						]
                    )
                    if (IS_APPROVED == 'Yes') {
						sh "terraform apply -input=false tfplan"
					}
                }
                
            }
        }
        stage("Destroy"){
            when { 
                anyOf{
					environment name: 'ACTION', value: 'destroy';
				}
			}
			steps {
                script{
                    def IS_APPROVED = input(
						message: "Destroy Develop Env !?!",
						ok: "Yes",
						parameters: [
							string(name: 'IS_APPROVED', defaultValue: 'No', description: 'Check the plan!!!')
						]
                    )
                    if (IS_APPROVED == 'Yes') {
						sh "terraform destroy -input=false tfplan"
					}
                }
               
            }
        }
    }
}