# backend Helm Chart

A Helm chart for deploying a generic backend application.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.x

## Installation

```sh
helm repo add myrepo https://myrepo.example.com
helm install backend myrepo/backend
```

Or, if using a local chart:

```sh
helm install backend .
```

## Upgrading

```sh
helm upgrade backend .
```

## Uninstalling

```sh
helm uninstall backend
```

## Configuration

The following table lists the configurable parameters of the chart and their default values.

| Parameter                | Description                                 | Default                        |
|--------------------------|---------------------------------------------|--------------------------------|
| `image.repository`       | Image repository                            | `10.70.0.28:4321/banjar-unhan/bahan-ajar-cms` |
| `image.tag`              | Image tag                                   | `latest`                       |
| `image.pullPolicy`       | Image pull policy                           | `Always`                       |
| `image.imagePullSecrets` | Image pull secrets                          | `[{"name": "regcred"}]`        |
| `deployment.replicas`    | Number of replicas                          | `1`                            |
| `service.type`           | Service type                                | `ClusterIP`                    |
| `service.port`           | Service port                                | `80`                           |
| `service.targetPort`     | Target port for the service                 | `1339`                         |
| `ingress.enabled`        | Enable ingress                              | `true`                         |
| `ingress.hosts`          | Ingress host(s)                             | `bahan.ajar.cms.10.70.0.45.nip.io` |
| `resources`              | Resource requests and limits                | `{cpu: 200m/400m, memory: 300Mi/600Mi}` |
| `envFrom`                | Environment variables from configMap/secret | See `values.yaml`              |
| `hpa.enabled`            | Enable Horizontal Pod Autoscaler            | `false`                        |
| `hpa.minReplicas`        | Minimum number of replicas for HPA          | `1`                            |
| `hpa.maxReplicas`        | Maximum number of replicas for HPA          | `5`                            |
| `hpa.targetCPUUtilizationPercentage` | Target CPU utilization for HPA         | `80`                           |

## Example

Here is an example `values.yaml` override:

```yaml
image:
  tag: "1.0.2"
deployment:
  replicas: 3
service:
  type: NodePort
  port: 8080
  targetPort: 1339
ingress:
  enabled: true
  hosts:
    - host: myapp.example.com
      paths:
        - path: /
          pathType: Prefix
resources:
  limits:
    cpu: 500m
    memory: 1Gi
  requests:
    cpu: 250m
    memory: 512Mi
hpa:
  enabled: true
  minReplicas: 2
  maxReplicas: 10
  targetCPUUtilizationPercentage: 75
```