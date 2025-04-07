# ConfigMaps in Kubernetes

## Introduction

This folder explores the concept of **ConfigMaps** in Kubernetes, which are used to decouple configuration data from application code. ConfigMaps allow you to manage configuration data in a centralized and reusable way, making your applications more flexible and easier to manage.

## What We Learned

### 1. ConfigMaps Overview
- ConfigMaps store configuration data as key-value pairs.
- They are used to inject configuration into pods without hardcoding it into the application.

### 2. Decoupling Configuration
- ConfigMaps enable separation of configuration from application code, making it easier to update configurations without rebuilding or redeploying the application.

### 3. Using ConfigMaps
- ConfigMaps can be used as environment variables, command-line arguments, or mounted as files in a pod.

### 4. Use Cases
- Managing application settings.
- Storing non-sensitive configuration data.
- Sharing configuration across multiple pods.

## Key Concepts Covered

- **Creating ConfigMaps**: How to define and create ConfigMaps using YAML files or `kubectl` commands.
- **Using ConfigMaps in Pods**: Injecting ConfigMap data into pods as environment variables or mounted volumes.
- **Updating ConfigMaps**: Best practices for updating ConfigMaps and ensuring changes are reflected in running pods.

## Folder Contents

This folder contains the following files:

1. **`configmap.yaml`**:
   - **Purpose**: Defines the ConfigMap configuration.
   - **Usage**: This file is used to create a ConfigMap in Kubernetes. It contains key-value pairs that store configuration data.
   - **What We Achieve**: Centralize configuration data for use in pods.

2. **`pod-configmap.yaml`**:
   - **Purpose**: Demonstrates how to use a ConfigMap in a pod.
   - **Usage**: This file defines a pod that uses the ConfigMap as environment variables or mounted volumes.
   - **What We Achieve**: Inject configuration data into a pod without hardcoding it.

3. **`update-configmap.yaml`**:
   - **Purpose**: Provides an example of updating a ConfigMap.
   - **Usage**: This file shows how to modify an existing ConfigMap and apply the changes.
   - **What We Achieve**: Learn how to update configuration data dynamically.

4. **`cleanup.yaml`**:
   - **Purpose**: Provides cleanup configurations for the ConfigMap and associated resources.
   - **Usage**: This file is used to delete all resources created by the ConfigMap examples.
   - **What We Achieve**: Simplify the cleanup process after testing or deployment.

## Prerequisites

Before working with the examples in this folder, ensure you have:
- A basic understanding of Kubernetes concepts like Pods and Deployments.
- Access to a Kubernetes cluster with appropriate permissions.

## How to Run the Examples

1. **Create the ConfigMap**:
   - Use `kubectl` to apply the `configmap.yaml` file:
     ```bash
     kubectl apply -f configmap.yaml
     ```

2. **Deploy the Pod Using the ConfigMap**:
   - Apply the `pod-configmap.yaml` file:
     ```bash
     kubectl apply -f pod-configmap.yaml
     ```

3. **Verify the Pod**:
   - Check the pod's status:
     ```bash
     kubectl get pods
     ```
   - Inspect the pod to verify the ConfigMap data:
     ```bash
     kubectl exec -it <pod-name> -- /bin/bash
     ```
   - Replace `<pod-name>` with the name of the pod.

4. **Update the ConfigMap**:
   - Apply the `update-configmap.yaml` file to modify the ConfigMap:
     ```bash
     kubectl apply -f update-configmap.yaml
     ```

5. **Verify the Update**:
   - Restart the pod to reflect the updated ConfigMap data:
     ```bash
     kubectl delete pod <pod-name>
     kubectl apply -f pod-configmap.yaml
     ```

## Cleanup Steps

To clean up the resources created by the examples:

1. **Delete the ConfigMap**:
   - Run the following command to delete the ConfigMap:
     ```bash
     kubectl delete -f configmap.yaml
     ```

2. **Delete the Pod**:
   - Remove the pod using the ConfigMap:
     ```bash
     kubectl delete -f pod-configmap.yaml
     ```

3. **Verify Cleanup**:
   - Ensure all resources have been deleted:
     ```bash
     kubectl get all
     ```

## Learning Outcomes

By studying the contents of this folder, you will:
- Understand the purpose and functionality of ConfigMaps.
- Learn how to create, use, and update ConfigMaps in Kubernetes.
- Gain insights into best practices for managing configuration data in Kubernetes.

## Additional Resources

For further reading, refer to the official Kubernetes documentation on ConfigMaps: [ConfigMaps Documentation](https://kubernetes.io/docs/concepts/configuration/configmap/)
