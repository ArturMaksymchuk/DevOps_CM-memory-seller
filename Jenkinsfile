pipeline{
    agent any
    stages{
                stage("Test"){
            steps{
                sh 'pwd'
                sh 'ls -la'
                sh 'rm -rf CM-memory-seller'
                sh 'git clone -b dev https://github.com/CMPetManager/CM-memory-seller.git'
                sh 'pwd'
                sh 'ls -la'
            }
            
        }

//         stage("package app"){
//             steps{
//                 sh "mvn package"
//             }
            
//         }

        stage("create docker image"){
            steps{
                sh "docker build  -t martur/app:$BUILD_NUMBER ."   
            }
            
        }


        stage("run docker image"){
            steps{
                sh "docker run -d -p 3333:3000 martur/app:$BUILD_NUMBER"   
            }
            
        }
//         stage("push image to hub"){
//             steps{
//                 script{
//                     withCredentials([string(credentialsId: 'githubpsw', variable: 'githubpwd')]) {
//     sh "docker login -u martur -p '${githubpwd}' "
// }
//                 }
//                 sh "docker push martur/app:$BUILD_NUMBER "
//                 sh "docker rmi martur/app:$BUILD_NUMBER "
//             }
            
//         }
//         stage("create cluster") {
//             environment {
//                 cluster_name = 'clinic2'
//              region_name = 'eu-central-1'
//               aws_instance_type = 't2.micro'
//               nodes_qty = 1
//               }
//              steps {
//               script {
//                  withAWS(region: 'eu-central-1', credentials: 'aws-credentials') {
//                       def current_cluster_name = sh(
//                     script: "eksctl get cluster $cluster_name | awk 'NR==2{print \$1}'",
//                     returnStdout: true
//                      ).trim()
//                      if (current_cluster_name == cluster_name) {
//                         sh "sed -i 's/latest/$BUILD_NUMBER/g' k8s/clinic.yaml"
//                           sh "aws eks update-kubeconfig --name $cluster_name"
//                           sh "kubectl apply -f k8s/clinic.yaml" 
//                           sh "kubectl get svc"
//                           sh "ls -la"
//                           sh "pwd"
//                       } else {
//                          sh "eksctl create cluster -f k8s/cluster.yaml"
//                          sh "sed -i 's/latest/$BUILD_NUMBER/g' k8s/clinic.yaml"
//                          sh "kubectl apply -f k8s/clinic.yaml" 
//                          sh "kubectl get svc" 
//                       }
//                      }
//                  }
//              }
//         }
   
    }
    
}