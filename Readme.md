# Spark on K8S: From cluster setting up to running jobs
In this project, I will explain how we can create a multi environment project using terraform and helm, then how we create PySpark jobs and run them in a K8S cluster using [spark-on-k8s operator](https://github.com/GoogleCloudPlatform/spark-on-k8s-operator).

## Cluster components
### jupyterhub
It's an important tool for development, it creates an instance for each team member, and allow as to configure multiple environment based on our needs (for exemple: data science environment, Spark enenvironment, ...)
### MinIO
It's an open source s3 server, we can use it with kubernetes volumes or configure it as a gateway for other cloud object storage services (S3, GCS...). It's important for development/testing, and it can be a part of our architecture if we want to be cloud agnostic
### spark-on-k8s
It's a K8S operator developed by Google team to facilitate running and monitoring spark jobs on K8S (the new spark cluster manager)