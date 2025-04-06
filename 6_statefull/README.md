# StatefulSets in Kubernetes

## Introduction

This folder explores the concept of **StatefulSets** in Kubernetes, a workload API object designed to manage stateful applications. StatefulSets are essential for applications that require stable network identities, persistent storage, and ordered deployment or scaling.

## What We Learned

### 1. StatefulSets Overview
- StatefulSets are used to manage stateful applications in Kubernetes.
- They differ from Deployments by providing guarantees about the ordering and uniqueness of pods.

### 2. Stable Network Identities
- Each pod in a StatefulSet gets a unique, stable network identity.
- This is achieved through predictable pod names (e.g., `pod-name-0`, `pod-name-1`).

### 3. Persistent Storage
- StatefulSets work with PersistentVolumeClaims (PVCs) to ensure data persists even if a pod is deleted or rescheduled.
- Each pod gets its own PVC, ensuring data isolation and consistency.

### 4. Ordered Deployment and Scaling
- Pods in a StatefulSet are created, updated, and deleted in a specific order.
- This ensures that applications dependent on pod order (e.g., leader-follower databases) function correctly.

### 5. Use Cases
- StatefulSets are ideal for:
  - Databases (e.g., MySQL, PostgreSQL).
  - Distributed systems (e.g., Kafka, Zookeeper).
  - Applications requiring stable storage and network identities.

## Key Concepts Covered

- **StatefulSet Definition**: How to define and configure a StatefulSet in Kubernetes.
- **PersistentVolume and PersistentVolumeClaim**: Setting up persistent storage for stateful applications.
- **Headless Services**: Using headless services to enable direct pod-to-pod communication.
- **Scaling StatefulSets**: Best practices for scaling stateful applications.
- **Rolling Updates**: Managing updates to StatefulSets while maintaining application stability.

## Folder Contents

This folder contains the following files:

1. **`statefulset.yaml`**:
   - **Purpose**: Defines the StatefulSet configuration.
   - **Usage**: This file is used to create a StatefulSet in Kubernetes. It specifies the number of replicas, pod templates, and volume claims.
   - **What We Achieve**: Deploy a stateful application with stable network identities and persistent storage.

2. **`service.yaml`**:
   - **Purpose**: Defines a headless service for the StatefulSet.
   - **Usage**: This file is used to create a headless service that enables direct communication between pods in the StatefulSet.
   - **What We Achieve**: Facilitate pod-to-pod communication and ensure stable DNS entries for each pod.

3. **`persistentvolume.yaml`**:
   - **Purpose**: Defines the PersistentVolume (PV) configuration.
   - **Usage**: This file is used to create a PersistentVolume that provides storage for the StatefulSet pods.
   - **What We Achieve**: Allocate storage resources for the StatefulSet pods.

4. **`persistentvolumeclaim.yaml`**:
   - **Purpose**: Defines the PersistentVolumeClaim (PVC) configuration.
   - **Usage**: This file is used to request storage from the PersistentVolume for each pod in the StatefulSet.
   - **What We Achieve**: Ensure each pod has its own dedicated storage.

5. **`cleanup.yaml`**:
   - **Purpose**: Provides cleanup configurations for the StatefulSet and associated resources.
   - **Usage**: This file is used to delete all resources created by the StatefulSet examples.
   - **What We Achieve**: Simplify the cleanup process after testing or deployment.

## Prerequisites

Before working with the examples in this folder, ensure you have:
- A basic understanding of Kubernetes concepts like Pods, Deployments, and Services.
- Access to a Kubernetes cluster with appropriate permissions.

## How to Run the Examples

1. **Apply the StatefulSet Configuration**:
   - Use `kubectl` to apply the YAML files in this folder:
     ```bash
     kubectl apply -f <statefulset-file>.yaml
     ```
   - Replace `<statefulset-file>.yaml` with the actual filename of the StatefulSet configuration.

2. **Verify the StatefulSet**:
   - Check the status of the StatefulSet:
     ```bash
     kubectl get statefulsets
     ```
   - Verify the pods created by the StatefulSet:
     ```bash
     kubectl get pods
     ```

3. **Access the Pods**:
   - Use `kubectl exec` to access a specific pod:
     ```bash
     kubectl exec -it <pod-name> -- /bin/bash
     ```
   - Replace `<pod-name>` with the name of the pod you want to access.

4. **Check Persistent Volumes**:
   - Verify the PersistentVolumes and PersistentVolumeClaims:
     ```bash
     kubectl get pvc
     kubectl get pv
     ```

## Cleanup Steps

To clean up the resources created by the examples:

1. **Delete the StatefulSet**:
   - Run the following command to delete the StatefulSet:
     ```bash
     kubectl delete -f <statefulset-file>.yaml
     ```

2. **Delete PersistentVolumeClaims**:
   - If the PersistentVolumeClaims are not automatically deleted, remove them manually:
     ```bash
     kubectl delete pvc <pvc-name>
     ```
   - Replace `<pvc-name>` with the name of the PersistentVolumeClaim.

3. **Verify Cleanup**:
   - Ensure all resources have been deleted:
     ```bash
     kubectl get all
     kubectl get pvc
     kubectl get pv
     ```

## Learning Outcomes

By studying the contents of this folder, you will:
- Understand the purpose and functionality of StatefulSets.
- Learn how to deploy and manage stateful applications in Kubernetes.
- Gain insights into best practices for using StatefulSets in production environments.

## Additional Resources

For further reading, refer to the official Kubernetes documentation on StatefulSets: [StatefulSets Documentation](https://kubernetes.io/docs/concepts/workloads/controllers/statefulset/)

