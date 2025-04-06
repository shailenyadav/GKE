# Kubernetes Ingress Example

This folder contains the configuration files for deploying a simple Kubernetes setup with two applications: a `notes-app` and an `nginx` server. These applications are exposed using Kubernetes services and an Ingress resource.

## Overview

The setup consists of the following components:
1. **Namespace**: All resources are deployed in the `nginx` namespace.
2. **Deployments**:
   - `notes-app-deployment`: Deploys the `notes-app` application.
   - `nginx-deployment`: Deploys the `nginx` server.
3. **Services**:
   - `notes-app-service`: Exposes the `notes-app` deployment.
   - `nginx-service`: Exposes the `nginx` deployment.
4. **Ingress**: Routes external traffic to the appropriate service based on the URL path.

## Files and Their Purpose

### 1. `namespace.yml`
Defines the `nginx` namespace where all resources are deployed.

### 2. `app_deployment.yml`
Defines the deployment for the `notes-app` application:
- Uses the `shailen91318/note-app-k8s` image.
- Exposes port `8000`.
- Includes resource requests and limits for CPU and memory.
- Configures a liveness probe to ensure the application is running.

### 3. `app_service.yml`
Defines a `ClusterIP` service for the `notes-app` deployment:
- Maps port `8000` of the service to port `8000` of the application.

### 4. `nginx_deployment.yml`
Defines the deployment for the `nginx` server:
- Uses the `nginx:latest` image.
- Exposes port `80`.

### 5. `nginx_service.yml`
Defines a `ClusterIP` service for the `nginx` deployment:
- Maps port `80` of the service to port `80` of the `nginx` container.

### 6. `ingress.yml`
Defines an Ingress resource to route external traffic:
- Routes requests with the path `/nginx` to the `nginx-service` on port `80`.
- Routes requests with the path `/` to the `notes-app-service` on port `8000`.
- Includes an annotation to rewrite the target URL path.

**Why use the annotation?**
The annotation is used to rewrite the target URL path so that the backend services can correctly handle the requests. Without this annotation, the backend services might not recognize the incoming requests due to mismatched paths, resulting in the pages not loading properly. For example, the `notes-app` expects requests at `/`, and the `nginx` server expects requests at `/nginx`. The annotation ensures that the paths are correctly rewritten before reaching the services.

## How It Works

1. **Namespace Creation**:
   - All resources are deployed in the `nginx` namespace to logically group them.

2. **Deployments**:
   - The `notes-app` and `nginx` applications are deployed as separate pods using their respective deployment configurations.

3. **Services**:
   - Each deployment is exposed using a `ClusterIP` service, which allows internal communication within the cluster.

4. **Ingress**:
   - The Ingress resource acts as a single entry point for external traffic.
   - Based on the URL path, traffic is routed to the appropriate service:
     - `/nginx` → `nginx-service`
     - `/` → `notes-app-service`

## Steps to Deploy

1. **Create the Namespace**:
   ```bash
   kubectl apply -f namespace.yml
   ```

2. **Deploy the Applications**:
   ```bash
   kubectl apply -f app_deployment.yml
   kubectl apply -f nginx_deployment.yml
   ```

3. **Create the Services**:
   ```bash
   kubectl apply -f app_service.yml
   kubectl apply -f nginx_service.yml
   ```

4. **Set Up the Ingress**:
   ```bash
   kubectl apply -f ingress.yml
   ```

5. **Verify the Setup**:
   - Check the namespace:
     ```bash
     kubectl get namespaces
     ```
   - Check the deployments:
     ```bash
     kubectl get deployments -n nginx
     ```
   - Check the services:
     ```bash
     kubectl get services -n nginx
     ```
   - Check the ingress:
     ```bash
     kubectl get ingress -n nginx
     ```

## Cleanup

To remove all resources created during the deployment, run the following command:

   ```bash
   kubectl delete -f namespace.yml
   ```
   
## Accessing the Applications

- **Notes App**: Access the `notes-app` by navigating to the root path `/` of the Ingress.
- **Nginx**: Access the `nginx` server by navigating to the `/nginx` path of the Ingress.

## Conclusion

This setup demonstrates how to deploy multiple applications in Kubernetes, expose them using services, and route traffic using an Ingress resource. It provides a scalable and organized way to manage application deployments and traffic routing.
