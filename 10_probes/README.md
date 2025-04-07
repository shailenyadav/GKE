# Kubernetes Probes

Kubernetes probes are mechanisms used to check the health and readiness of containers running in a pod. There are three types of probes:

1. **Liveness Probe**: Determines if the container is still running. If the liveness probe fails, Kubernetes will restart the container. This is useful for detecting and recovering from deadlocks or unresponsive states.

2. **Readiness Probe**: Checks if the container is ready to serve requests. If the readiness probe fails, Kubernetes will remove the pod from the service's endpoints, ensuring that traffic is not sent to an unready container.

3. **Startup Probe**: Used to check if the application within the container has started successfully. This is particularly useful for applications with long initialization times. If the startup probe fails, Kubernetes will restart the container.

## Example YAML Configuration

Below is an example configuration for a pod with liveness, readiness, and startup probes:

```yaml
apiVersion: v1
kind: Pod
metadata:
  name: probe-example
spec:
  containers:
  - name: example-container
    image: example-image
    livenessProbe:
      httpGet:
        path: /healthz
        port: 8080
      initialDelaySeconds: 3
      periodSeconds: 5
    readinessProbe:
      httpGet:
        path: /readyz
        port: 8080
      initialDelaySeconds: 5
      periodSeconds: 10
    startupProbe:
      httpGet:
        path: /startz
        port: 8080
      initialDelaySeconds: 10
      periodSeconds: 5
```

## Commands to Deploy and Test

### Step 1: Apply the YAML Configuration
Run the following command to deploy the pod with probes:
```bash
kubectl apply -f probe-example.yaml
```

### Step 2: Verify the Pod Status
Check the status of the pod to ensure it is running and the probes are functioning:
```bash
kubectl get pods
kubectl describe pod probe-example
```

### Step 3: Simulate Failures
To test the probes, you can simulate failures by stopping the endpoints (`/healthz`, `/readyz`, `/startz`) in your application and observing how Kubernetes reacts.

### Step 4: View Logs
Inspect the logs of the container to debug or verify probe behavior:
```bash
kubectl logs probe-example
```

## Cleanup

To remove the deployed resources, run the following command:
```bash
kubectl delete -f probe-example.yaml
```

This will delete the pod and associated resources created by the YAML configuration.

## Additional Notes

- Ensure your application exposes the endpoints (`/healthz`, `/readyz`, `/startz`) as specified in the probes.
- Adjust the `initialDelaySeconds` and `periodSeconds` values based on your application's startup and response times.
- Use `kubectl describe pod` to troubleshoot probe failures and understand why a pod might be restarting or marked as unready.
