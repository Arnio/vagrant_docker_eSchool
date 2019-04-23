node {
     stage('copy Files') {
          sh "ls "+"/vagrant/"
          sh "cp -r "+"/vagrant/* "+"${env.WORKSPACE}"
     }
     stage('GIT checkout') {
         git branch: 'master', url: 'https://github.com/IF-090Java/eSchool.git'
     }
     stage('mvn packege') {
         def mvnHome = tool name: 'Maven_name', type: 'maven'
         def mvnCMD = "${mvnHome}/bin/mvn"
         sh label: '', script: "${mvnCMD} clean package"
     }

     stage('build docker image DB') {
         
         sh 'docker build -t arnio/eschool-db:1.0.0 -f db/Dockerfile .'
         
     }
     stage('build docker image backend') {
         sh "cp "+"${env.WORKSPACE}"+"/target/*.jar "+"backend/"
         sh 'docker build -t arnio/eschool-back:1.0.0 -f backend/Dockerfile .'
         
     }
     stage('start containers ') {
         sh 'docker run -d --name db arnio/eschool-db:1.0.0'
         sh 'docker run -d --link db -p 8081:8080 arnio/eschool-back:1.0.0'
         
     }

}