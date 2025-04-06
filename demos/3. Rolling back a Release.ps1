###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/DeployingAppsToK8sUsingHelm
# 
# Rolling back a release
#  
# Andrew Pruski
# @dbafromthecold
# www.dbafromthecold.com
# 
###################################################################################################
###################################################################################################



# view release
helm list



# view release history
helm history sqlserver



# view kubernetes objects
kubectl get all



# view replicasets
kubectl get replicasets



# rollback release
helm rollback sqlserver 1



# view release history
helm history sqlserver



# view kubernetes objects
kubectl get all



# view replicasets
kubectl get replicasets



# view the container image in the deployment
kubectl get deployment -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }' && echo ""



# confirm sql server version
IpAddress=$(kubectl get service sqlserver --no-headers -o custom-columns=":status.loadBalancer.ingress[*].hostname") && echo $IpAddress
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION AS [VERSION];"



# clean up
helm delete sqlserver