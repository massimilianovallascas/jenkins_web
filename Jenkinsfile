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
        echo "Testing"
        sh """
          chmod +x test.sh
          ./test.sh ${env.BUILD_NUMBER}
        """
      }
    }

    stage("Deploy") {
      steps {
        echo "Deploying"
        sshPublisher(
          publishers: [
            sshPublisherDesc(
              configName: 'http', 
              transfers: [
                sshTransfer(
                  cleanRemote: false, excludes: '', 
                  execCommand: 'mv index.html /var/www/html/index.html', 
                  execTimeout: 120000, 
                  flatten: false, 
                  makeEmptyDirs: false, 
                  noDefaultExcludes: false, 
                  patternSeparator: '[, ]+', 
                  remoteDirectory: '', 
                  remoteDirectorySDF: false, 
                  removePrefix: '', 
                  sourceFiles: 'index.html'
                )
              ], 
              usePromotionTimestamp: false, useWorkspaceInPromotion: false, verbose: false
            )
          ]
        )
      }
    }
  }
}
