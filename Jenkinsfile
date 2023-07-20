pipeline {
    agent {
        label 'maven'
    }

    stages {
        stage('Source') {
            steps {
                git 'https://github.com/alejomh88/titulacion.git'
            }
        }
        stage('Build') {
            steps {
                echo 'Building stage!'
		sh 'mvn clean install'
            }
        }
	stage('Docker image build and push') {
		steps {
		script {
    		// Build and push image with Jenkins' docker-plugin
    		withDockerServer([uri: "tcp://172.17.0.1:2375"]) {
		 withCredentials([string(credentialsId: 'dockerhubpwd', variable: 'dockerHubPwd')]) {
      		withDockerRegistry([credentialsId: "dockerhubpwd", url: "https://hub.docker.com/repositories/alejo88"]) {
        	// we give the image the same version as the .war package
      		}  
    	    }
		}
	}
	}
	}
	/*
	stage('Scan') {
            steps {
                echo 'Scan!'
                withSonarQubeEnv(installationName: 'sonarqubetest') {
		  sh 'mvn clean package sonar:sonar'
		}
            }
        }
	*/
    }
}
