pipeline {
    agent any
    
    parameters {
        string(name: 'TITLE', defaultValue: 'Palindrome Checker', description: 'Title for the HTML page')
        string(name: 'STRING_TO_CHECK', defaultValue: 'racecar', description: 'Enter a string to check if it is a palindrome')
    }
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Generate HTML') {
            steps {
                script {
                    // Execute the batch script with parameters
                    bat "generate_html.bat \"${params.TITLE}\" \"${params.STRING_TO_CHECK}\""
                    
                    // Archive only the HTML file
                    archiveArtifacts artifacts: 'output/index.html', fingerprint: true
                }
            }
        }
    }
    
    post {
        success {
            echo "HTML file successfully generated!"
            echo "Access the HTML output at: ${BUILD_URL}artifact/output/index.html"
        }
    }
} 