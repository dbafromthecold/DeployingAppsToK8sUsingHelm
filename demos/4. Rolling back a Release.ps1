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
helm history nginx



# view kubernetes objects
kubectl get all



# view replicasets
kubectl get replicasets



# rollback release
helm rollback nginx 1



# view release history
helm history nginx



# view kubernetes objects
kubectl get all



# view replicasets
kubectl get replicasets



# view the container image in the deployment
kubectl get deployment -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }' && echo ""



###################################################################################################
# Rolling back without the old replicaset
###################################################################################################



# clean up previous release
helm delete nginx



# confirm deletion
helm list --all



# view kubernetes objects
kubectl get all



# deploy specific version of chart
helm install nginx dbafromthecold/nginx --version 0.1.0



# upgrade release
helm upgrade nginx dbafromthecold/nginx --version 0.2.0



# confirm history
helm history nginx



# view kubernetes objects
kubectl get all



# view replicasets
kubectl get replicaset



# get oldest replicaset
replicaSet=$(kubectl get replicaset --sort-by='{.metadata.creationTimestamp}' --no-headers | head -1 | awk '{print $1}') && echo $replicaSet



# delete old replicaset
kubectl delete replicaset $replicaSet



# confirm deletion
kubectl get replicaset



# view history using kubectl
kubectl rollout history deployment nginx



# try a rollback with kubectl - will fail as we have deleted the old replicaset
kubectl rollout undo deployment/nginx



# but we still have the history of the release in Helm
helm history nginx



# rollback with helm
helm rollback nginx 1



# confirm status of release
helm list



# confirm rollback
helm history nginx



# view all kubernetes objects
kubectl get all



# view the container image in the deployment
kubectl get deployment -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }' && echo ""



# view replicaset
kubectl get replicaset



# the old replicaset is back!
echo $replicaSet



# this is due to the release history being stored as secrets in the k8s cluster
kubectl get secrets



# let's a look at one of those secrets
kubectl get secret sh.helm.release.v1.nginx.v1 -o yaml



# the secret is encoded. For further information on decoding these secrets, see here: -
# https://dbafromthecold.com/2020/08/10/decoding-helm-secrets/ 



kubectl get secret sh.helm.release.v1.nginx.v1 \
-o jsonpath="{ .data.release }" | base64 -d | base64 -d | gunzip -c | jq '.chart.templates[].data' | tr -d '"' | base64 -d | code -



# clean up
helm delete nginx
