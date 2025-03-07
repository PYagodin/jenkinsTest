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
                    // Create output directory if it doesn't exist (handled by the script now)
                    
                    // Try different Node.js commands depending on what's available
                    def nodeCmd = ''
                    def exitCode = bat(script: 'node --version', returnStatus: true)
                    
                    if (exitCode == 0) {
                        nodeCmd = 'node'
                    } else {
                        exitCode = bat(script: 'nodejs --version', returnStatus: true)
                        if (exitCode == 0) {
                            nodeCmd = 'nodejs'
                        } else {
                            // If neither node nor nodejs is in PATH, try with the full path to node
                            // This assumes Node.js is installed in the default location
                            nodeCmd = 'C:\\Program Files\\nodejs\\node.exe'
                        }
                    }
                    
                    // Execute the JavaScript script with parameters
                    bat "${nodeCmd} generate_html.js \"${params.TITLE}\" \"${params.COLOR}\""
                    
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