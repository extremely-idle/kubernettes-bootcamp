#Get all deployments
kubectl get deployments

#Scale a deployment to 4 replicas
kubectl scale deployments/kubernetes-bootcamp --replicas=4

#Check pods
kubectl get pods -o wide

#Check that the replica size was logged in the deployment event log
kubectl describe deployments/kubernetes-bootcamp

#Find the IP and port of the service
kubectl describe services/kubernetes-bootcamp

#Find and store the node port
export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT

#Call app (should hit a different pod on each call)
curl $(minikube ip):$NODE_PORT

#Scale down a deployment to 2 replicas from 4
kubectl scale deployments/kubernetes-bootcamp --replicas=2