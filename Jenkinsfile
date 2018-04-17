#!/usr/bin/env groovy

node {
 
   stage('checkout') {
        checkout scm
    }

    stage('check java') {
        sh "java -version"
    }

    stage('clean') {
        //sh "./mvnw clean"
        sh "/usr/bin/mvn clean"
    }
   
   stage('packaging') {
        //sh "./mvnw package -Pprod -DskipTests"
        sh "/usr/bin/mvn package -Pprod -DskipTests"
        archiveArtifacts artifacts: '**/target/*.jar', fingerprint: true
    }
  
   //def fileName = "/var/lib/jenkins/workspace/${env.JOB_NAME}/coe-spring-data-cassandra-rest-0.0.1-SNAPSHOT.jar"
   
  //def artifactLocation ="/var/lib/jenkins/workspace/${env.JOB_NAME}/coe-spring-data-cassandra-rest"
  
   
  stage ('docker build'){
      withCredentials([[$class: "UsernamePasswordMultiBinding", usernameVariable: 'DOCKERHUB_USER', passwordVariable: 'DOCKERHUB_PASS', credentialsId: 'dockerhub_id']]) {
      sh 'docker login --username $DOCKERHUB_USER --password $DOCKERHUB_PASS'
    }
    def serverImage = docker.build('snyamars007/coe-spring-data-h2-rest')
    serverImage.push('latest')
    sh 'docker logout'
   }
   
 /***
   stage 'notifyKubernetes'
     try{
      sh "kubectl delete deployment coe-spring-data-h2-rest"
     }catch(e){
      println("no prior deployment exists")
     }
     try{
          sh "kubectl delete svc coe-spring-data-h2-rest"   
     }catch(e){
      println("no prior service exists")
     }
   
      sh "sleep 3s"
      sh "kubectl run --image=snyamars007/coe-spring-data-h2-rest:latest coe-spring-data-h2-rest  --port=8080"
      sh "kubectl expose deployment coe-spring-data-h2-rest"
  ****/
}//end of node
