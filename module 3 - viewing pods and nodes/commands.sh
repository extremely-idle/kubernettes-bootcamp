kubectl get pods

kubectl describe pods

#In a new terminal
kubectl proxy

#In original terminal
#Get pod name
export POD_NAME=$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME

curl http://localhost:8001/api/v1/namespaces/default/pods/$POD_NAME/proxy/

#Access logs
kubectl logs $POD_NAME

#Perform command on the container (name of container can be omitted as there is only 1 container in the pod)
kubectl exec $POD_NAME env

#Start bash
kubectl exec -ti $POD_NAME bash

#Check out source code of JS app
cat server.js

#Check JS app is running...
curl localhost:8080

#Exit bash
exit