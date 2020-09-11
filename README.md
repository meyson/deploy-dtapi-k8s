D-tester kubernetes deployment 
----------
This repository contains code that automatically deploys **D-tester** on GCE.

**D-tester** is a student achievement tracking system, that was created by SoftServe IT Academy students and their mentors. More information you can find bellow.

* [frontend](https://github.com/meyson/IF-105.UI.dtapi.if.ua.io)
* [backend](https://github.com/meyson/dtapi)

### Initialize CI/CD (or simply deploy application)
1. Install Docker, kubectl, and gcloud on your machine.
1. [Authorize gcloud](https://cloud.google.com/sdk/gcloud/reference/auth/login) and [kubectl](https://cloud.google.com/kubernetes-engine/docs/how-to/cluster-access-for-kubectl) to access the Cloud Platform with Google user credentials.
1. Install and initialize [Ingress controller for Google Cloud](https://cloud.google.com/config-connector/docs/overview).
1. Familiarize yourself with [GCR](https://cloud.google.com/container-registry/docs/quickstart) and enable its API.
1. Fork [FE](https://github.com/meyson/IF-105.UI.dtapi.if.ua.io) [BE](https://github.com/meyson/dtapi) and change GCR URL in `.circleci/config.yml`.
1. [Set up the project](https://circleci.com/docs/2.0/getting-started/) in Circle CI UI and don't forget [environment variables](https://circleci.com/docs/2.0/env-vars/).
1. If everything is ready, Circleci CI will be building your images and push it to GCR.
1. Run `./k8s/init.sh` to deploy resources.


