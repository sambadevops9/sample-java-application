Pipeline {
  agent any
  tools {
    maven "3.6.0"
  }
  stages {
    stage("Continues Download") {
      steps {
        git branch: 'main', url: 'https://github.com/sambadevops9/sample-java-application.git'
      }
    }
    stage('Clean and install') {
      steps {
        bat 'mvn clean install'
      }
    }
    stage('Package') {
      steps {
        bat 'mvn package'
      }
    }
    stage('server') {
      steps {
        rtserver(
          id: "Artifactory",
          url: 'http://20.42.56.106:8081/artifactory',
          username: admin,
          password: Samba @345,
          bypassProxy: true,
          timeout: 300
        )
      }
    }
    stage('upload') {
      steps {
        rtupload(
          serverID: 'Artifactory',
          spec: ''
          '{
          "files": [{
            "pattern": "*.war",
            "target": "logic-ops-lab-libs-snapshot-local"
          }]
        }
        ''
        '),
      }
    }
    stage('Publish build info') {
      steps {
        rtpublishBuildInfo(
          serverId: "Artifactory"
        )
      }
    }
  }
}