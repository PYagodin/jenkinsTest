pipeline {
    agent any
    parameters {
        string(name: 'BRANCH_NAME', defaultValue: 'main', description: 'Branch to build')
    }
    environment {
        REPO_URL = 'https://github.com/PYagodin/jenkinsTest.git'
        SCRIPT_NAME = 'script.py'
        HTML_OUTPUT = 'output.html'
    }
    stages {
        stage('Clone Repository') {
            steps {
                git branch: params.BRANCH_NAME, url: env.REPO_URL
            }
        }
        stage('Run Script') {
            steps {
                sh 'python3 ${SCRIPT_NAME} > ${HTML_OUTPUT}'
            }
        }
        stage('Publish HTML Report') {
            steps {
                publishHTML([
                    allowMissing: false,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: '',
                    reportFiles: env.HTML_OUTPUT,
                    reportName: 'Script Output',
                    reportTitles: 'Output'
                ])
            }
        }
    }
    post {
        success {
            echo "Build successful! View output at ${env.BUILD_URL}/Script%20Output/"
        }
        failure {
            echo "Build failed. Check logs for details."
        }
    }
}
