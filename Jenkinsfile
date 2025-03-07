pipeline {
    agent any
    
    parameters {
        string(name: 'TITLE', defaultValue: 'Jenkins Pipeline HTML Output', description: 'Title for the HTML page')
        choice(name: 'COLOR', choices: ['#3498db', '#e74c3c', '#2ecc71', '#f39c12', '#9b59b6'], description: 'Background color of the HTML page')
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
                    // Create output directory if it doesn't exist
                    sh 'mkdir -p output'
                    
                    // Execute the Python script with parameters
                    sh "python generate_html.py '${params.TITLE}' '${params.COLOR}'"
                    
                    // Archive the artifacts
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