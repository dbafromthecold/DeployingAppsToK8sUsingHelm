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



# confirm deployment deleted
kubectl get all
