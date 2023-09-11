###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/DeployingAppsToK8sUsingHelm
# 
# Deploying a Chart to Kubernetes
#  
# Andrew Pruski
# @dbafromthecold
# www.dbafromthecold.com
# 
###################################################################################################
###################################################################################################



##################################################
# view yaml files for charts
##################################################



# navigage to work directory
cd ~ && pwd
mkdir helmdemos && cd helmdemos



# confirm current context
kubectl config current-context



# switch context if needed
kubectl config use-context docker-desktop



# test connection to cluster
kubectl get nodes



# list helm repositories
helm repo list



# add repository
helm repo add dbafromthecold https://raw.githubusercontent.com/dbafromthecold/DeployingAppsToK8sUsingHelm/main/



# list helm repositories
helm repo list



# search repository for a nginx chart
helm search repo dbafromthecold/nginx



# search repository for a nginx chart
helm search repo dbafromthecold/nginx --versions



# show chart definition
helm show chart dbafromthecold/nginx



# test deployment of chart
helm install nginx dbafromthecold/nginx --dry-run --debug



# deploy chart
helm install nginx dbafromthecold/nginx



# confirm deployment
helm list



# view status of release
helm status nginx



# view kubernetes objects
kubectl get all



# view the container image in the deployment
kubectl get deployment -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }' && echo ""



# find nginx version in the pod
POD=$(kubectl get pods -o jsonpath="{.items[0].metadata.name}") && echo $POD
kubectl exec $POD -- nginx -v



# test nginx
IpAddress=$(kubectl get service nginx --no-headers -o custom-columns=":status.loadBalancer.ingress[*].hostname") && echo $IpAddress
#IpAddress=$(kubectl get service nginx --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip") && echo $IpAddress
curl $IpAddress



# view release history
helm history nginx



# uninstall a release
helm uninstall nginx --keep-history



# view release history
helm history nginx



# confirm
helm list



# confirm with --all flag
helm list --all



# view objects
kubectl get all



# delete release
helm delete nginx



# confirm with --all flag
helm list --all


