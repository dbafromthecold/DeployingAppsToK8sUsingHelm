###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/DeployingAppsToK8sUsingHelm
# 
# Retrieving information about a release
#  
# Andrew Pruski
# @dbafromthecold
# www.dbafromthecold.com
# 
###################################################################################################
###################################################################################################



# view deployments
helm list



# view status of release
helm status nginx



# get release manifests
helm get manifest nginx | code -



# get release notes
helm get notes nginx | code -



# get all from release
helm get all nginx | code -



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


