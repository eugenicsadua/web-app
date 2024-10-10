pipeline{
    agent any
    tools{
        maven 'maven'
    }
    
    stages{
        stage('git checkout'){
            steps{
                git branch: 'main', url: 'https://github.com/eugenicsadua/web-app.git'
            }
        }
        
        stage('maven goals'){
            steps{
                sh 'mvn clean package'
            }
        }
    }
    
    post {
        success{
            slackSend channel: 'automation-test', color: 'good', message: "Build successful: ${currentBuild.fullDisplayName}"
        }
        failure {
            slackSend channel: 'automation-test', color: 'danger', message: "Build failed: ${currentBuild.fullDisplayName}"
        }
        aborted {
            slackSend channel: 'automation-test', color: 'warning', message: "Build aborted: ${currentBuild.fullDisplayName}"
        }
    }
    
}