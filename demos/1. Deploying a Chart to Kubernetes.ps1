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



# search repository for a sqlserver chart
helm search repo dbafromthecold/sqlserver



# search repository for a sqlserver chart
helm search repo dbafromthecold/sqlserver --versions



# show chart definition
helm show chart dbafromthecold/sqlserver



# test deployment of chart
helm install sqlserver dbafromthecold/sqlserver --dry-run --debug



# deploy chart
helm install sqlserver dbafromthecold/sqlserver



# confirm deployment
helm list



# view status of release
helm status sqlserver



# view kubernetes objects
kubectl get all



# view the container image in the deployment
kubectl get deployment -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }' && echo ""



# confirm sql server version
IpAddress=$(kubectl get service sqlserver --no-headers -o custom-columns=":status.loadBalancer.ingress[*].hostname") && echo $IpAddress
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION AS [VERSION];"



# view release history
helm history sqlserver



# uninstall a release
helm uninstall sqlserver --keep-history



# view release history
helm history sqlserver



# confirm
helm list



# confirm with --all flag
helm list --all



# view objects
kubectl get all



# delete release
helm delete sqlserver



# confirm with --all flag
helm list --all


