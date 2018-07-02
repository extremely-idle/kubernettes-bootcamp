#Get pod details
kubectl get pods

#Get service details
kubectl get services

#Create new service using "NodePort" type
kubectl expose deployment/kubernetes-bootcamp --type="NodePort" --port 8080

#Describe specific service
kubectl describe services/kubernetes-bootcamp

#Find and store node port
export NODE_PORT=$(kubectl get services/kubernetes-bootcamp -o go-template='{{(index .spec.ports 0).nodePort}}')
echo NODE_PORT=$NODE_PORT

#Check that the service is exposed
curl $(minikube ip):$NODE_PORT

#Describe deployment to find the automatically created label
kubectl describe deployment

#Get pods filtered by a specific label
kubectl get pods -l run=kubernetes-bootcamp

#Get services filtered by a specific label
kubectl get services -l run=kubernetes-bootcamp

#Find and store pod name
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME

#Create new label against a pod
kubectl label pod $POD_NAME app=v1

#Check the label was created successfully
kubectl describe pods $POD_NAME

#Delete a service by label
kubectl delete service -l run=kubernetes-bootcamp