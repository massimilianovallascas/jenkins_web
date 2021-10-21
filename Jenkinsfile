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
          utils.replaceString()
        }
      }
    }

    stage("Test") {
      steps {
        sh """
          bash test.sh "<p><small>Deployed by Jenkins job: ${BUILD_NUMBER}</small></p>"
        """
      }
    }

    stage("Deploy") {
      steps {
        echo "Deploying"
      }
    }
  }
}
