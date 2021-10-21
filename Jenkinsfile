@Library('jenkins_shared') _

pipeline {
  agent any
  
  options {
    timestamps()
  }

  stages {
    stage("Build") {
      steps {
        echo "Building"
        helloVariable("Massi")
        script {
          utils.printFromFunction()
        }
      }
    }

    stage("Test") {
      parallel {
        stage("Test on Linux") {
          steps {
            echo "Testing on Linux"
          }
        }
        stage("Test on Windows") {
          steps {
            echo "Testing on Windows"
          }
        }
      }
    }

    stage("Deploy") {
      steps {
        echo "Deploying"
      }
    }
  }
}
