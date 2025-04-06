# Kubernetes Deployment for Nginx

This folder contains the necessary Kubernetes manifests to deploy an Nginx application in a Google Kubernetes Engine (GKE) cluster. The deployment includes a namespace, a deployment resource, and a service to expose the application.

## Folder Structure

- `namespace.yml`: Defines the namespace for the Nginx application.
- `deployment.yml`: Contains the deployment configuration for the Nginx pods.

## Prerequisites

Before deploying the resources, ensure the following:

1. You have access to a GKE cluster.
2. `kubectl` is installed and configured to interact with your GKE cluster.
3. Sufficient permissions to create namespaces, deployments, and other Kubernetes resources.

## Deployment Steps

Follow these steps to deploy the Nginx application:

### 1. Create the Namespace

The namespace isolates the resources for the Nginx application. Apply the `namespace.yml` file:

```bash
kubectl apply -f namespace.yml
```

### 2. Deploy the Nginx Application

The `deployment.yml` file defines the deployment for the Nginx pods. Apply it using:

```bash
kubectl apply -f deployment.yml
```

### 3. Verify the Deployment

Check the status of the deployment and pods:

```bash
kubectl get deployments -n nginx
kubectl get pods -n nginx
```

### 4. Expose the Application (Optional)

If you want to expose the Nginx application externally, you can create a service (e.g., LoadBalancer or NodePort). Update the `deployment.yml` or create a separate service manifest.

## Cleanup

To remove the deployed resources, run:

```bash
kubectl delete -f deployment.yml
kubectl delete -f namespace.yml
```

## Notes

- The deployment uses the `nginx:latest` image.
- The application listens on port `80` inside the container.
- The number of replicas is set to `2` by default. You can adjust this in the `deployment.yml` file.

Feel free to modify the manifests to suit your requirements.
