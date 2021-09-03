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

    stage('Build Docker Image') {
      steps {
        sh 'docker build . --tag letsdeploy'
        sh 'docker kill "$(docker ps -q)"'
      }
    }

    stage('RUN') {
      steps {
        sh 'docker run -p 8088:80 -d letsdeploy'
      }
    }

  }
}