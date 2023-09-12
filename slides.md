# Deploying Applications to Kubernetes using Helm

---

## Andrew Pruski

<img src="images/apruski.jpg" style="float: right"/>

### Field Solutions Architect
### Microsoft Data Platform MVP

<!-- .slide: style="text-align: left;"> -->
<i class="fab fa-twitter"></i><a href="https://twitter.com/dbafromthecold">  @dbafromthecold</a><br>
<i class="fas fa-envelope"></i>  dbafromthecold@gmail.com<br>
<i class="fab fa-wordpress"></i>  www.dbafromthecold.com<br>
<i class="fab fa-github"></i><a href="https://github.com/dbafromthecold">  github.com/dbafromthecold</a>

---

### Session Aim
<!-- .slide: style="text-align: left;"> -->
To provide an overview of Helm and how it can be used to deploy applications to Kubernetes

---

### Agenda
<!-- .slide: style="text-align: left;"> -->
- An overview of Helm<br>
- Deploying an application<br>
- Upgrading an application using Helm<br>
- Rolling back an upgrade using Helm<br>
- Chart Repositories

---

# Helm

---

### What is Helm?

<img src="images/helm_logo.png"  style="float: right"/>
<!-- .slide: style="text-align: left;"> -->
<br>
<font size="6">
A package manager for Kubernetes<br>
Charts define applications<br>
With Helm you can: -<br>
    - Mange complexity<br>
    - Easily update and rollback<br>
    - Share charts<br>
</font>

---

### History of Helm
<!-- .slide: style="text-align: left;"> -->
- Created in 2015<br>
- Introduced at KubeCon in November 2015<br>
- Merged with Google's Deployment Manager in January 2016<br>
- Open source - https://github.com/helm/helm<br>
- More than 2 million downloads a month<br>
- Graduated status within the CNCF in April 2020<br>

---

### Artifact Hub
<!-- .slide: style="text-align: left;"> -->
<p align="center">
<a href="https://artifacthub.io/">
<img src="images/artifact_hub.png" />
</a>
</p>

---

# Demos

---

# Packaging a Chart

---

### Chart Structure
<!-- .slide: style="text-align: left;"> -->
<p align="center">
<img src="images/chart_directory.png" />
</p>

---

### Chart Template Directory
<!-- .slide: style="text-align: left;"> -->
<p align="center">
<img src="images/chart_template_directory.png" />
</p>

---

# Demos

---

## Resources
<!-- .slide: style="text-align: left;"> -->
<font size="6">
<a href="https://github.com/dbafromthecold/DeployingAppsToK8sUsingHelm">https://github.com/dbafromthecold/DeployingAppsToK8sUsingHelm</a><br>
</font>

<p align="center">
<img src="images/deployingappstok8shelm.png" />
</p>
