pipeline{
    agent {label 'aws'}
    options{
        timeout(5)
    }
    stages{
                stage("1 clone git repository"){
            steps{
                sh 'rm -rf CM-memory-seller'
                sh 'git clone -b dev https://github.com/CMPetManager/CM-memory-seller.git'

            }
            
        }

        stage("2 stop and delete all docker conteiner"){
            steps{
                sh "docker ps -aq | xargs docker stop || true" 
                sh "docker ps -aq | xargs docker rm || true"   
            }
            
        }
        
        stage("3 create docker image"){
            steps{
                sh "docker build  -t martur/app:$BUILD_NUMBER ."   
            }
            
        }

        stage("4 run docker image"){
            steps{
                sh "docker run -d -p 3333:3000 martur/app:$BUILD_NUMBER"   
            }
            
        }

        stage("5 clear docker temp"){
            steps{
                sh "docker system prune -af"   
            }
            
        }
        
   
    }
    
}
