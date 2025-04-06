# Notes App Kubernetes Configuration

This folder contains Kubernetes configuration files for deploying and managing the `notes-app` application on any Kubernetes cluster. Below is a detailed explanation of each file and its purpose:

## Files

### 1. `namespace.yml`
- **Purpose**: Defines a Kubernetes namespace for isolating resources related to the `notes-app`.
- **What it achieves**: 
  - Creates a namespace called `notes-app` to logically group all resources related to the application.
  - Helps in organizing and managing resources in a multi-tenant or multi-environment cluster.

### 2. `deployment.yml`
- **Purpose**: Defines the deployment configuration for the `notes-app`.
- **What it achieves**:
  - Deploys the `notes-app` containerized application using the image `shailen91318/note-app-k8s`.
  - Ensures high availability by specifying the number of replicas (currently set to 1).
  - Configures resource requests and limits to optimize resource usage.
  - Adds a liveness probe to monitor the health of the application and restart it if necessary.

### 3. `service.yml`
- **Purpose**: Defines a Kubernetes Service to expose the `notes-app` deployment.
- **What it achieves**:
  - Creates a `ClusterIP` service named `notes-app-service` to allow internal communication within the cluster.
  - Maps port `8000` of the service to port `8000` of the application container.
  - Ensures that other components in the cluster can communicate with the `notes-app` using the service.

## How to Use

1. **Create the Namespace**:
   Apply the `namespace.yml` file to create the `notes-app` namespace:
   ```bash
   kubectl apply -f namespace.yml
   ```

2. **Deploy the Application**:
   Apply the `deployment.yml` file to deploy the `notes-app`:
   ```bash
   kubectl apply -f deployment.yml
   ```

3. **Expose the Application**:
   Apply the `service.yml` file to create the service:
   ```bash
   kubectl apply -f service.yml
   ```

4. **Verify the Deployment**:
   - Check the namespace:
     ```bash
     kubectl get namespaces
     ```
   - Check the deployment:
     ```bash
     kubectl get deployments -n notes-app
     ```
   - Check the service:
     ```bash
     kubectl get services -n notes-app
     ```

## Cleanup Steps

To remove all resources created for the `notes-app`, follow these steps:

1. **Delete the Service**:
   ```bash
   kubectl delete -f service.yml
   ```

2. **Delete the Deployment**:
   ```bash
   kubectl delete -f deployment.yml
   ```

3. **Delete the Namespace**:
   ```bash
   kubectl delete -f namespace.yml
   ```

4. **Verify Cleanup**:
   - Ensure the namespace is deleted:
     ```bash
     kubectl get namespaces
     ```
   - Ensure no resources related to `notes-app` exist:
     ```bash
     kubectl get all -n notes-app
     ```

## Summary

By using these configuration files, you can:
- Deploy the `notes-app` in a structured and isolated namespace.
- Ensure the application is highly available and monitored for health.
- Expose the application internally within the cluster for communication.
- Clean up all resources when they are no longer needed.

This setup is ideal for deploying a containerized application on any Kubernetes cluster.
