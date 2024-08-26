# gcp-app-engine
This repository demonstrates how to deploy an application with microservice architecture to Google App Engine (GAE) on the Google Cloud Platform (GCP).

You will find two folders in this repository. These folders contain the application's frontend and backend services.

#### frontend
The frontend is a simple Golang application that listens on port `8080`. When calling this service, it will call the backend and return the result. The frontend will prepend the result with `Backend said: ` - everything after will be whatever the backend returns.

#### backend
The backend is also a simple Golang application that listens on port `8080`. When called, this service returns `Hello world!`

## Deploy the application
You can quickly deploy the application. If you have [`just`](https://github.com/casey/just) installed, you can run `just deploy <project-id>`. This command will insert the GCP project ID where necessary and deploy the application to GAE.

If you don't have `just` installed, you can see the necessary commands in the [`Justfile`](./Justfile).

## How to make sure that it's working?
If you navigate to [GAE in GCP](https://console.cloud.google.com/appengine/services), you can click the different services to open them in a new tab. You can see that the response differs for each service.
