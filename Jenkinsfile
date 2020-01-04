node {
    def app
    stage('Preparation') {
        git 'https://github.com/faurik/student-exam2.git'
    }
    stage('Test') {
        sh """
        python3 -m venv venv
        . venv/bin/activate
        pip install -e '.[test]'
        coverage run -m pytest
        coverage report
        """
    }
    stage('Build Docker image') {
        app = docker.build('faurik95/cicd-exam:app')
    }
    stage('Push Docker image to registry') {
        docker.withRegistry('https://registry.hub.docker.com', 'dockerhub') {
            app.push()
        }
    }
}
