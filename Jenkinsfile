@Library('jenkins_shared') _

pipeline {
  agent any
  
  options {
    timestamps()
  }

  environment {
    GITHUB = credentials("gitcredentials")
  }
  
  parameters {
    string(name: 'Name', defaultValue: 'Massi', description: 'Your name')
  }
  
  stages {
    stage("Build") {
      steps {
        echo "Building"
        echo "${GITHUB_USR}"
        echo "${GITHUB_PSW}"
        echo "${params.Name}"
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
  post {
    always {
      archiveArtifacts artifacts: 'index.html', fingerprint: true, followSymlinks: false
    }
    cleanup {
      cleanWs()
    }
  }
}
