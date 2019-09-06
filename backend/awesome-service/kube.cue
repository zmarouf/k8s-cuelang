package kube

deployment awesome spec template spec containers: [{
	ports: [{
		containerPort: 8080
		protocol:      "TCP"
	}]
}]
service awesome spec ports: [{
	name: "awesome-tchannel"
}]
