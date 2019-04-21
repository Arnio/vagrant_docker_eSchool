node {
     stage('GIT checkout') {
         git branch: 'master', url: 'https://github.com/IF-090Java/eSchool.git'
     }
     stage('mvn packege') {
         def mvnHome = tool name: 'Maven_name', type: 'maven'
         def mvnCMD = "${mvnHome}/bin/mvn"
         sh label: '', script: "${mvnCMD} clean package"
     }
     stage('build docker image') {
         sh 'docker build -t arnio/eschool-back:1.0.0 .'
     }

}


   def mvnHome
   stage('Preparation') { // for display purposes
      // Get some code from a GitHub repository
      git 'https://github.com/jglick/simple-maven-project-with-tests.git'
      // Get the Maven tool.
      // ** NOTE: This 'M3' Maven tool must be configured
      // **       in the global configuration.           
      mvnHome = tool 'M3'
   }
   stage('Build') {
      // Run the maven build
      if (isUnix()) {
         sh "'${mvnHome}/bin/mvn' -Dmaven.test.failure.ignore clean package"
      } else {
         bat(/"${mvnHome}\bin\mvn" -Dmaven.test.failure.ignore clean package/)
      }
   }
   stage('Results') {
      junit '**/target/surefire-reports/TEST-*.xml'
      archiveArtifacts 'target/*.jar'
   }