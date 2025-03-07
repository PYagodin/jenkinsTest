# Jenkins Pipeline Project

This project demonstrates a Jenkins Pipeline that generates an HTML file based on user-defined parameters.

## Project Requirements

- Jenkins job configured to run with parameters (title and color)
- Output of the script is an HTML file
- Job execution provides a link to the output file
- Script hosted on GitHub as part of a Pipeline
- Files editable via Visual Studio, allowing updates to the GitHub repository

## Files

- `Jenkinsfile`: Defines the Jenkins pipeline with parameters
- `generate_html.py`: Python script that generates the HTML output file
- `README.md`: This documentation file

## How to Use

1. Set up a Jenkins pipeline job pointing to this repository
2. Run the job, providing values for the parameters:
   - `TITLE`: The title to display in the HTML page
   - `COLOR`: Background color of the HTML page (choose from predefined options)
3. After successful job execution, a link to the generated HTML file will be provided in the build logs

## Pipeline Steps

1. Checkout the source code from the repository
2. Run the Python script to generate the HTML file
3. Archive the HTML file as an artifact
4. Display a link to the output file

## Requirements

- Jenkins with Pipeline plugin
- Python 3.x installed on the Jenkins agent
