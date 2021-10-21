pipeline {
  agent any
  
  options {
    timestamps()
  }

  stages {
    stage("Build") {
      steps {
        echo "Building"
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
