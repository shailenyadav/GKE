# Taints and Tolerations in Kubernetes

## Overview

Taints and tolerations are mechanisms in Kubernetes that allow you to control which pods can be scheduled on specific nodes. Taints are applied to nodes, and tolerations are applied to pods. A pod can only be scheduled on a node if it tolerates the node's taints.

This folder demonstrates how to use taints and tolerations in Kubernetes.

---

## Tainting Nodes

To prevent pods from being scheduled on specific nodes unless they have the appropriate tolerations, you can taint the nodes. Below are the commands to taint the nodes in your cluster:

### Commands to Taint Nodes

1. **Taint `kind-cluster-worker`:**
   ```bash
   kubectl taint nodes kind-cluster-worker pod=true:NoSchedule
   ```

2. **Taint `kind-cluster-worker2`:**
   ```bash
   kubectl taint nodes kind-cluster-worker2 pod=true:NoSchedule
   ```

3. **Taint `kind-cluster-worker3`:**
   ```bash
   kubectl taint nodes kind-cluster-worker3 pod=true:NoSchedule
   ```

The `pod=true:NoSchedule` taint ensures that no pods can be scheduled on these nodes unless they explicitly tolerate this taint.

---

## Configuring Tolerations in Pod YAML

To allow a pod to be scheduled on a node with the `pod=true:NoSchedule` taint, you need to add a toleration to the pod's YAML configuration.

### Example Pod YAML with Toleration

Below is an example of a pod YAML file with a toleration for the `pod=true:NoSchedule` taint:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: example-pod
spec:
  containers:
  - name: nginx
    image: nginx
  tolerations:
  - key: "pod"
    operator: "Equal"
    value: "true"
    effect: "NoSchedule"
```

### Explanation of the Toleration

- **`key: "pod"`**: Matches the key of the taint applied to the node.
- **`operator: "Equal"`**: Specifies that the key and value must match exactly.
- **`value: "true"`**: Matches the value of the taint applied to the node.
- **`effect: "NoSchedule"`**: Matches the effect of the taint applied to the node.

---

## Steps to Apply the Configuration

1. **Taint the Nodes:**
   Run the commands mentioned above to taint the nodes.

2. **Create the Pod YAML File:**
   Save the example YAML configuration to a file, e.g., `example-pod.yaml`.

3. **Apply the Pod Configuration:**
   Use the following command to create the pod:
   ```bash
   kubectl apply -f example-pod.yaml
   ```

4. **Verify the Pod Scheduling:**
   Check if the pod is scheduled on one of the tainted nodes:
   ```bash
   kubectl get pods -o wide
   ```

   The pod should be scheduled on a node with the `pod=true:NoSchedule` taint.

---

## Summary

This folder demonstrates how to use taints and tolerations to control pod scheduling in Kubernetes. By following the steps above, you can ensure that only specific pods are scheduled on nodes with specific taints.

For more information, refer to the [Kubernetes documentation on taints and tolerations](https://kubernetes.io/docs/concepts/scheduling-eviction/taint-and-toleration/).
