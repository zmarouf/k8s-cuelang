package kube

deployment <ID>: {
	apiVersion: "apps/v1beta1"
	kind:       "Deployment"
	metadata: {
		name:      ID
		namespace: Component
		labels "app.kubernetes.io/name": ID
	}
	spec: {
		replicas: *1 | int
		strategy: {
			type: "RollingUpdate"
			rollingUpdate: {
				maxSurge:       1
				maxUnavailable: 0
			}
		}
		selector matchLabels "app.kubernetes.io/name": ID
		template: {
			metadata labels "app.kubernetes.io/name": ID
			spec: {
				restartPolicy:                 "Always"
				terminationGracePeriodSeconds: 60
				containers: [{
					name:            ID
					imagePullPolicy: "IfNotPresent"
					image:           "local/\(Component)/\(ID)"
					env: [{
						name: "NEXUS_URL"
						valueFrom configMapKeyRef: {
							name: "nexus-config"
							key:  "nexus.url"
						}
					}, {
						name: "NEXUS_ENV"
						valueFrom configMapKeyRef: {
							name: "nexus-config"
							key:  "nexus.env"
						}
					}, {
						// JAEGER_AGENT_HOST points to the Agent daemon on the Node
						name: "JAEGER_AGENT_HOST"
						valueFrom fieldRef fieldPath: "status.hostIP"
					}]
				}]
			}
		}
	}
}

service <ID>: {
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name:      ID
		namespace: Component
		labels "app.kubernetes.io/name": ID
	}
	spec: {
		ports: [...{
			port:       *8080 | int
			protocol:   *"TCP" | "UDP"
			targetPort: *8080 | int
		}]
		selector "app.kubernetes.io/name": ID
		type: "NodePort"
	}
}

Component :: string
