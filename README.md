#Stacksmith meets Google Cloud Platform Managed VMs

##Objective
Create an webapp using Google App Engine (https://cloud.google.com/appengine/docs) for deployment/orchestration and 
Bitnami Stacksmith (https://stacksmith.bitnami.com) for software stack creation and maintenance.

##TL;DR Version

    git clone https://github.com/nomisbeme/managedvm-hello-world.git
    cd managedvm-hello-world
    gcloud preview app deploy app.yaml
Wait for GAE to build container image, deploy updated module
```
curl https://<project-id>.appspot.com
pizza is awesome
```
##Implementation Notes
1. Uses Ruby/Sinatra as the demo application - same approach can be used for other Stacksmith languages and frameworks
1. Dockerfile was slightly modified to create /var/log/app_engine/custom_logs as required for GAE to collect application logs (ref: https://cloud.google.com/appengine/docs/managed-vms/custom-runtimes/build)
1. Basic app health checking has been implemented

##Possible Improvements
1. Cleanly abstracting out GAE app plumbing from app logic, perhaps by deriving from Sinatra::Base?
1. Integrate with Cloud Tracing (https://cloud.google.com/trace/)
1. Simplify generated Dockerfile for GAE case.
1. Anything else? PRs and issues gratefully received.
