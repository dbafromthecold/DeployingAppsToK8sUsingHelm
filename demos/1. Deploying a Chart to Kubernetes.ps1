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



# jump into WSL
wsl --distribution Ubuntu-22.04



# navigage to work directory
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
