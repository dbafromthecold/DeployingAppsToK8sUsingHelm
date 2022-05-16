###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/DeployingAppsToK8sUsingHelm
# 
# Upgrading a release
#  
# Andrew Pruski
# @dbafromthecold
# www.dbafromthecold.com
# 
###################################################################################################
###################################################################################################



# search the repository for a chart
helm search repo dbafromthecold/nginx



# search the stable repository for a chart and retrieve the different versions (2 in the repo)
helm search repo dbafromthecold/nginx --versions



# test installing a specific version of the chart
helm install nginx dbafromthecold/nginx --version 0.1.0 --dry-run --debug



# install a specific version of the chart
helm install nginx dbafromthecold/nginx --version 0.2.0



# confirm release deployed
helm list



# view kubernetes objects
kubectl get all



# view service
kubectl get service



# view release
helm list --all



# view status
helm status nginx



# upgrade the release
helm upgrade nginx dbafromthecold/nginx --version 0.1.0



# confirm release upgraded
helm list



# view status
helm status nginx



# view history of release
helm history nginx



# view kubernetes objects
kubectl get all



# view the container image in the deployment
kubectl get deployment -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }' && echo ""



