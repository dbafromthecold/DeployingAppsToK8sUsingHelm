###################################################################################################
###################################################################################################
#
# https://github.com/dbafromthecold/DeployingAppsToK8sUsingHelm
# 
# Packaging a chart
#  
# Andrew Pruski
# @dbafromthecold
# www.dbafromthecold.com
# 
###################################################################################################
###################################################################################################



# create a chart
helm create testchart



# view the chart directory
ls ./testchart



# view the templates directory
ls ./testchart/templates



# remove all files in the templates directory
rm -rf ./testchart/templates/*



# remove the default values.yaml file - we will create a new one of these later - TBD
rm ./testchart/values.yaml



# copy templates into the chart
cp -R /mnt/c/git/dbafromthecold/DeployingAppsToK8sUsingHelm/yaml/* ./testchart/templates/



# view the templates directory
ls ./testchart/templates



# create NOTES.txt file
echo 'A test Helm Chart' > ./testchart/templates/NOTES.txt



# remove the charts directory (not needed, no chart dependencies)
rm -r ./testchart/charts



# list contents of chart
ls ./testchart



# view chart.yaml
cat ./testchart/Chart.yaml



# view _helper.tpl file
cat ./testchart/templates/_helpers.tpl && echo ""



# test deploying the chart
helm install testchart ./testchart --dry-run --debug



# deploy the chart
helm install testchart ./testchart



# view release
helm list



# view kubernetes objects
kubectl get all -n nginx



# view deployment labels
kubectl get deployment -n nginx --show-labels



# delete the release
helm delete testchart



# view values.yaml file
cat ./testchart/values.yaml



# update the deployment yaml to use template directives
# copy {{ .Release.Name }} in for the deployment name
vim ./testchart/templates/deployment.yaml



# also update the value.yaml file, removing the old file
rm ./testchart/values.yaml



# get nginx image tags
curl https://mcr.microsoft.com/v2/nginx/tags/list > list
cat list



# and add in a custom value
echo 'containerImage: nginx:1.20' > ./testchart/values.yaml



# confirm values.yaml
cat ./testchart/values.yaml



# update the deployment yaml to use the new default value
# copy {{ .Values.containerImage }} in for the container image name
vim ./testchart/templates/nginx-deployment.yaml



# now redeploy the chart
helm install testchart ./testchart



# view release
helm list



# view status
helm status testchart



# view kubernetes objects - note deployment name
kubectl get all -n nginx



# view the container image in the deployment
kubectl get deployment -n nginx -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }' && echo ""



# now upgrade the chart, overriding the image name in the values file
helm upgrade testchart ./testchart --set containerImage=mcr.microsoft.com/nginx:1.0.4



# view release
helm list



# view status
helm status testchart



# view history
helm history testchart



# view supplied values
helm get values testchart



# view the container image in the deployment
kubectl get deployment -n nginx -o jsonpath='{ .items[*].spec.template.spec.containers[*].image }' && echo ""



# confirm kubernetes objects
kubectl get all -n nginx



# package the chart
helm package ./testchart --destination .



# view packaged chart
ls -al



# clean up 
helm delete testchart
