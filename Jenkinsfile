pipeline {
  agent any
  stages {
    stage('Clean Workspace') {
      steps {
        echo 'Workspace Cleaning'
        cleanWs(cleanWhenSuccess: true, cleanWhenNotBuilt: true)
      }
    }

    stage('Git Checkout') {
      steps {
        git(url: 'https://github.com/handoreyn/LetsDeploy', branch: 'master', poll: true)
      }
    }

    stage('Restore Packages') {
      steps {
        sh 'dotnet restore'
      }
    }

    stage('Build Project') {
      steps {
        sh 'dotnet build'
      }
    }

    stage('Docker Compose Up') {
      steps {
        sh 'docker-compose up --build -d'
      }
    }

  }
}