# run this script with bash and exit automatically on error
set -e 

# define name of api
NAME="kubernetes-demo-api"
# define username:
USERNAME="mustafa908"
# define docker image name
IMAGE="$USERNAME/$NAME:latest"

echo "Building Docker image..."
# build docker image
docker build -t $IMAGE . 
# push docker image to docker hub
echo "Pushing Docker image to Docker Hub..."
docker push $IMAGE
# apply kubernetes deployment and service
echo "Applying Kubernetes manifests..."
kubectl apply -f k8s/deployement.yaml
kubectl apply -f k8s/service.yaml
# get pods status
echo "Getting pods status..."
kubectl get pods
# get service status
echo "Getting service status..."
kubectl get services
# fetching main service:
echo "Fetching main service..."
kubectl get services $NAME-service


