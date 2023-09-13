###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/DeployingAppsToK8sUsingHelm
# 
# Creating a remote Helm repository
#  
# Andrew Pruski
# @dbafromthecold
# www.dbafromthecold.com
# 
###################################################################################################
###################################################################################################



##################################################
# go to Github and create a repository
##################################################



# clone repository locally
git clone https://github.com/dbafromthecold/DemoHelmRepo.git



# navigate to repo
cd DemoHelmRepo



# copy packaged chart into repo
cp ../testchart-0.1.0.tgz .



# index repo
helm repo index .



# view index.yaml
cat index.yaml



# push chart to Github
git add .
git commit -m "added testchart to repo"
git push



##################################################
# get URL from index.yaml file in GitHub repository
##################################################


# view Helm repos
helm repo list



# add Githb repo as a Helm repository
helm repo add testrepo https://raw.githubusercontent.com/dbafromthecold/DemoHelmRepo/main



# view new Helm repository
helm repo list



# search new Helm repository
helm search repo testrepo/testchart



# deploy chart from repository
helm install testchart testrepo/testchart



# confirm deployment
helm list



# view status
helm status testchart



# view kubernetes objects
kubectl get all



# connect to sql server
IpAddress=$(kubectl get service sqlserver --no-headers -o custom-columns=":status.loadBalancer.ingress[*].hostname") && echo $IpAddress
#IpAddress=$(kubectl get service sqlserver --no-headers -o custom-columns=":status.loadBalancer.ingress[*].ip") && echo $IpAddress
mssql-cli -S $IpAddress -U sa -P Testing1122 -Q "SELECT @@VERSION AS [VERSION];"



# clean up
helm delete testchart
rm index.yaml testchart-0.1.0.tgz
git add .
git commit -m "cleaned repo"
git push
