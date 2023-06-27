pipeline {
  agent any

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
  }
}
