pipeline {
    agent any
    
    parameters {
        string(name: 'TITLE', defaultValue: 'Palindrome Checker', description: 'Title for the HTML page')
        string(name: 'STRING_TO_CHECK', defaultValue: 'racecar', description: 'Enter a string to check if it is a palindrome')
    }
    
    stages {
        stage('Clone Repository') {
            steps {
                // Explicitly clone the GitHub repository
                git url: 'https://github.com/PYagodin/jenkinsTest.git', branch: 'main'
                echo "Repository successfully cloned from https://github.com/PYagodin/jenkinsTest.git"
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
        
        stage('Publish to GitHub Pages') {
            steps {
                script {
                    // Create docs directory for GitHub Pages if it doesn't exist
                    bat 'if not exist docs mkdir docs'
                    
                    // Copy the HTML file to the docs directory
                    bat 'copy output\\index.html docs\\index.html'
                    
                    // Configure Git for the push
                    bat 'git config user.email "jenkins@example.com"'
                    bat 'git config user.name "Jenkins Pipeline"'
                    
                    // Add, commit, and push the docs directory
                    bat 'git add docs/'
                    bat 'git commit -m "Update GitHub Pages with latest palindrome check result"'
                    bat 'git push origin main'
                }
            }
        }
    }
    
    post {
        success {
            echo "HTML file successfully generated!"
            echo "Access the HTML output at: ${BUILD_URL}artifact/output/index.html"
            echo "Public GitHub Pages URL: https://PYagodin.github.io/jenkinsTest/"
        }
    }
} 