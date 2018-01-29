minikube start --vm-driver hyperv
minikube addons enable ingress
minikube dashboard
& ./minikube docker-env | Invoke-Expression