pipeline {
    agent any // הרץ את המשימה על כל סוכן זמין
    
    parameters { // הגדר פרמטרים לתהליך
        string(name: 'TITLE', defaultValue: 'Palindrome Checker', description: 'Title for the HTML page') // כותרת לדף HTML
        string(name: 'STRING_TO_CHECK', defaultValue: 'racecar', description: 'Enter a string to check if it is a palindrome') // מחרוזת לבדיקה האם היא פלינדרום
    }
    
    stages { // הגדר שלבים בתהליך
        stage('Clone Repository') { // שלב שבו מעתיקים את הקוד מהמאגר
            steps {
                // שלב בו מעתיקים באופן מפורש את המאגר מגיטהאב
                git url: 'https://github.com/PYagodin/jenkinsTest.git', branch: 'main' // העתק את המאגר מגיטהאב מהענף הראשי
                echo "Repository successfully cloned from https://github.com/PYagodin/jenkinsTest.git" // הודעה על הצלחת העתקת המאגר
                // הגדרת משתנה סביבה שמתעד את העתקת המאגר
                script {
                    env.REPO_INFO = "Repository cloned: https://github.com/PYagodin/jenkinsTest.git (branch: main)" // שמור את פרטי המאגר במשתנה סביבה
                }
            }
        }
        
        stage('Generate HTML') { // שלב יצירת קובץ HTML
            steps {
                script { // הגדרת בלוק סקריפט
                    // הרץ את סקריפט הבאטץ' עם הפרמטרים, כולל מידע על המאגר
                    bat "generate_html.bat \"${params.TITLE}\" \"${params.STRING_TO_CHECK}\" \"${env.REPO_INFO}\"" // הרץ את סקריפט הבאטץ' עם כל הפרמטרים
                    
                    // שמור את קובץ ה-HTML כארטיפקט
                    archiveArtifacts artifacts: 'output/index.html', fingerprint: true // שמור את קובץ התוצאה כארטיפקט
                }
            }
        }
        
        stage('Publish to GitHub Pages') { // שלב פרסום התוצאות לגיטהאב פייג'ס
            steps {
                script {
                    // צור תיקיית docs למטרת גיטהאב פייג'ס, אם היא לא קיימת
                    bat 'if not exist docs mkdir docs' // צור תיקיית docs אם היא לא קיימת
                    
                    // העתק את קובץ ה-HTML לתיקיית docs
                    bat 'copy output\\index.html docs\\index.html' // העתק את הקובץ לתיקיית docs
                    
                    // הגדר את הגיט לשליחת השינויים
                    bat 'git config user.email "jenkins@example.com"' // הגדר את האימייל לשימוש בגיט
                    bat 'git config user.name "Jenkins Pipeline"' // הגדר את שם המשתמש לשימוש בגיט
                    
                    // הוסף, בצע commit ודחוף את תיקיית docs
                    bat 'git add docs/' // הוסף את התיקייה לשלב ההכנה לקומיט
                    bat 'git commit -m "Update GitHub Pages with latest palindrome check result"' // בצע קומיט עם הודעה
                    bat 'git push origin main' // דחוף את השינויים לענף הראשי בגיטהאב
                }
            }
        }
    }
    
    post { // פעולות לאחר סיום הריצה
        success { // במקרה של הצלחה
            echo "HTML file successfully generated!" // הודעה על יצירת הקובץ בהצלחה
            echo "Access the HTML output at: ${BUILD_URL}artifact/output/index.html" // קישור לקובץ התוצאה
            echo "Public GitHub Pages URL: https://PYagodin.github.io/jenkinsTest/" // קישור לדף הציבורי בגיטהאב פייג'ס
        }
    }
} 