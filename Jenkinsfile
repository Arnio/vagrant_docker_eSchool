node {
     stage('copy Files') {
          sh "ls "+"/vagrant/"
          sh "cp -r "+"/vagrant/* "+"${env.WORKSPACE}/"
     }
     stage('GIT checkout backend') {
         git branch: 'master', url: 'https://github.com/IF-090Java/eSchool.git'
     }
     stage('mvn packege') {
         def mvnHome = tool name: 'Maven_name', type: 'maven'
         def mvnCMD = "${mvnHome}/bin/mvn"
         sh label: '', script: "${mvnCMD} clean package"
     }

     stage('GIT checkout frontend') {
         git branch: 'master', url: 'https://github.com/IF-092-UI/final_project.git'
     }
     stage('bild frontend') {
         sh "sed -i -e s+https://fierce-shore-32592.herokuapp.com+http://backend:8080+g "+"${env.WORKSPACE}"+"/src/app/services/token-interceptor.service.ts"
         sh 'yarn install'
         sh 'ng build --prod'

     }


     stage('build docker image DB') {
         
         sh 'docker build -t arnio/eschool-db:1.0.0 -f db/Dockerfile .'
         
     }
     stage('build docker image backend') {
         sh "cp "+"${env.WORKSPACE}"+"/target/*.jar "+"backend/"
         sh 'docker build -t arnio/eschool-back:1.0.0 -f backend/Dockerfile .'
         
     }
     stage('build docker image Frontend') {
         
         sh 'docker build -t arnio/eschool-front:1.0.0 -f frontend/Dockerfile .'
         
     }   
     stage('start containers ') {
         sh 'docker run -d --name db arnio/eschool-db:1.0.0'
         sh 'docker run -d --name backend --link db:db -p 8081:8080 arnio/eschool-back:1.0.0'
         sh 'docker run -d --name frontend --link backend:backend -p 80:80 arnio/eschool-front:1.0.0'

         
     }

}