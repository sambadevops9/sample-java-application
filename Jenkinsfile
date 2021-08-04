pipeline{
    agent any
    
    tools {
        maven "Maven-3.6.0"
    }
    environment {
        registry = "6421/docker-test"
        registryCredential = 'dockerhub'
        dockerImage = ''
    }
    stages
    {
        stage('Continues Download')
        {
            steps
            {
                git branch: 'main', url: 'https://github.com/sambadevops9/sample-java-application.git'
            }
        }
        stage ('Quality Check')
        {
            steps
            {
                sh '''mvn sonar:sonar \\
                -Dsonar.projectKey=sonartoken \\
                -Dsonar.host.url=http://52.188.185.223:9000/ \\
                -Dsonar.login=57037d20e845b1129c8228f74cf0bcb2dbb171b8'''
            }
        }
        stage('Continues Build')
        {
            steps
            {
                sh label: '', script: 'mvn package'
            }
        }
        stage('Server')
        {
            steps
            {
                rtServer(
                    id: "Artifactory-Server",
                    url: 'http://52.188.185.223:8081/artifactory',
                    username: 'admin',
                    password: 'Samba@345',
                    bypassProxy: true,
                    timeout: 300
                    )
            }
        }
        stage('Upload')
        {
            steps
            {
                rtUpload(
                    serverId: 'Artifactory-Server',
                    spec: '''{
                        "files": [{
                            "pattern": "*.jar",
                            "target": "libs-release-local"
                            }
                        ]
                    }'''
                )
            }
        }
        stage('Building image')
        {
            steps
            {
                script {
                        dockerImage = docker.build registry
                }
            }
        }
    }
}
