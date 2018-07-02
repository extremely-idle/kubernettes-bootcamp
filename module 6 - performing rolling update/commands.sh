#Get deployments
kubectl get deployments

#Get pods
kubectl get pods

#Check versions (Image field)
kubectl describe pods

#Update version (using new image)
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=jocatalin/kubernetes-bootcamp:v2

#Get exposed IP and port of the service
kubectl describe services/kubernetes-bootcamp

#Find and store the node port
export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT

#Call app to check version in use
curl $(minikube ip):$NODE_PORT

#Check rollout status
kubectl rollout status deployments/kubernetes-bootcamp

#Update to version 10...
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp=gcr.io/google-samples/kubernetes-bootcamp:v10

#Undo rollout
kubectl rollout undo deployments/kubernetes-bootcamp