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
                //sh ("terraform init")
                script{
                    def IS_APPROVED = input(
						message: "Change preexisting state !?!",
						ok: "Yes",
						parameters: [
							string(name: 'IS_APPROVED', defaultValue: 'No', description: 'Changing!!!')
						]
                    )
                    if (IS_APPROVED == 'Yes') {
                        //sh ("terraform init")
						sh ("terraform init -backend-config=/var/jenkins_home/workspace/Multibranch_Terraform_master/terraform.tfstate")

					}
                }
                
            }
        }
        stage("Terraform Plan"){
            steps{
                sh ("terraform plan -out tfplan")
                sh ("terraform show -no-color tfplan > tfplan.txt")
            }
           
        }
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
                not{
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
						sh "terraform destroy --auto-approve"
					}
                }
               
            }
        }
        stage("Graphic"){
            steps{
                script{
                    sh "terraform graph -plan=tfplan"
                    sh "terraform graph | dot -Tsvg > graph.svg"
                }
            }
        }
    }
}