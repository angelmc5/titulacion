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
      		withDockerRegistry(credentialsId: 'dockerHubCredentials', url: "https://index.docker.io/v1/") {
        	// we give the image the same version as the .war package
			image = docker.build("alejo88/titulacion", ".")
       		        image.push()
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
