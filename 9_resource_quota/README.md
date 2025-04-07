# Resource Quota Management

This folder contains scripts, configurations, and documentation related to managing resource quotas in a Kubernetes environment. Resource quotas are used to limit the resource consumption (e.g., CPU, memory, storage) of namespaces to ensure fair usage and prevent resource exhaustion.

## Purpose

The purpose of this folder is to:
- Define and manage resource quotas for Kubernetes namespaces.
- Provide examples and templates for setting up resource quotas.
- Include commands for applying, verifying, and cleaning up resource quotas.

## Prerequisites

Before using the scripts or commands in this folder, ensure you have:
- A Kubernetes cluster up and running.
- `kubectl` installed and configured to interact with your cluster.
- Appropriate permissions to create and manage resource quotas.

## Commands

### 1. Apply Resource Quota

To apply a resource quota to a namespace, use the following command:

```bash
kubectl apply -f <resource-quota-file>.yaml
```

Replace `<resource-quota-file>.yaml` with the name of the YAML file defining the resource quota.

### 2. Verify Resource Quota

To verify that the resource quota has been applied, use:

```bash
kubectl get resourcequota -n <namespace>
```

Replace `<namespace>` with the name of the namespace where the resource quota was applied.

For detailed information about the resource quota, use:

```bash
kubectl describe resourcequota <quota-name> -n <namespace>
```

Replace `<quota-name>` with the name of the resource quota.

### 3. Cleanup Resource Quota

To delete a resource quota, use the following command:

```bash
kubectl delete -f <resource-quota-file>.yaml
```

Alternatively, you can delete a specific resource quota by name:

```bash
kubectl delete resourcequota <quota-name> -n <namespace>
```

### 4. List All Resource Quotas

To list all resource quotas in a namespace, run:

```bash
kubectl get resourcequota -n <namespace>
```

## Cleanup Instructions

If you want to clean up all resource quotas in a namespace, you can use the following command:

```bash
kubectl delete resourcequota --all -n <namespace>
```

This will delete all resource quotas in the specified namespace.

## Example Resource Quota YAML

Below is an example of a resource quota YAML file:

```yaml
apiVersion: v1
kind: ResourceQuota
metadata:
  name: example-quota
  namespace: example-namespace
spec:
  hard:
    pods: "10"
    requests.cpu: "4"
    requests.memory: "8Gi"
    limits.cpu: "8"
    limits.memory: "16Gi"
```

Save this file as `example-quota.yaml` and apply it using the `kubectl apply` command.

## Notes

- Always test resource quotas in a development or staging environment before applying them to production.
- Monitor resource usage regularly to ensure quotas are appropriate for your workloads.

