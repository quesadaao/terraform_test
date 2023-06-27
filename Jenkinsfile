pipeline {
  agent any

  environment {
    AWS_ACCESS_KEY_ID = credentials('aws-access-key-id')
    AWS_SECRET_ACCESS_KEY = credentials('aws-secret-access-key')
  }

  stages {
    stage('Checkout') {
      steps {
        // Clonar el repositorio de código fuente que contiene el código de Terraform
        git 'https://github.com/quesadaao/terraform_test.git'
      }
    }

    stage('Terraform Init') {
      steps {
        // Inicializar Terraform y descargar los plugins requeridos
        sh 'terraform init -input=false'
      }
    }

    stage('Terraform Plan') {
      steps {
        // Ejecutar el comando terraform plan para ver los cambios propuestos
        sh 'terraform plan -input=false -out=tfplan'
      }
    }

    stage('Terraform Apply') {
      steps {
        // Aplicar los cambios en la infraestructura de AWS
        sh 'terraform apply -input=false tfplan'
      }
    }

    stage('Terraform Destroy') {
      steps {
        // Ejecutar el comando terraform destroy para eliminar los recursos
        sh 'terraform destroy -auto-approve'
      }
    }
  }
}
