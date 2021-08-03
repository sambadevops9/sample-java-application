pipeline{
    agent any
    
    tools {
        maven "Maven-3.6.0"
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
                -Dsonar.host.url=http://20.42.56.106:9000/ \\
                -Dsonar.login=d6bfcb99440838bcbc6de47de0c5fc89e3ee101d'''
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
                    url: 'http://20.42.56.106:8081/artifactory',
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
    }
}