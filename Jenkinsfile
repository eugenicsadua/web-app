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
        
        stage('code analysis'){
            environment{
                scannerHome = tool 'sonar'
            }
            steps{
                script{
                    withSonarQubeEnv('sonar'){
                        sh "${scannerHome}/bin/sonar-scanner -Dsonar.projectKey=devops-webapp"
                    }
                    
                }
            }
        }
        
        stage('Quality Gate'){
            steps {
                timeout(time: 1, unit: 'MINUTES'){
                    waitForQualityGate abortPipeline: true
                }
            }
        }

         stage('artifact upload'){
            steps{
              nexusArtifactUploader artifacts: [[artifactId: 'maven-web-application', classifier: '', file: '/var/lib/jenkins/workspace/devops-webapp/target/web-app.war', type: 'war']], credentialsId: 'nexus-credentials', groupId: 'com.mt', nexusUrl: '3.83.165.176:8081/repository/devops-webapp/', nexusVersion: 'nexus3', protocol: 'http', repository: 'devops-webapp', version: '3.8.1-Release'
            }
        }

        stage('deploy to prod'){
            steps{
                deploy adapters: [tomcat9(credentialsId: 'tomcat-credentials', path: '', url: 'http://3.85.220.250:8080')], contextPath: null, war: 'target/web-app.war'
            }
        }
    }
    
    post{
        success{
            slackSend channel: 'automation-test', color: 'good', message: "Build successful: ${currentBuild.fullDisplayName}"
        }
        failure{
            slackSend channel: 'automation-test', color: 'danger', message: "Build failed: ${currentBuild.fullDisplayName}"
        }
        aborted{
            slackSend channel: 'automation-test', color: 'warning', message: "Build aborted: ${currentBuild.fullDisplayName}"
        }
    }
    
}