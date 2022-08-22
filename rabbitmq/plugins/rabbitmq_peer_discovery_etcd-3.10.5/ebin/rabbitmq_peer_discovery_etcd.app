{application, 'rabbitmq_peer_discovery_etcd', [
	{description, "etcd-based RabbitMQ peer discovery backend"},
	{vsn, "3.10.5"},
	{id, "v3.10.4-9-g8d4b3a4"},
	{modules, ['rabbit_peer_discovery_etcd','rabbitmq_peer_discovery_etcd','rabbitmq_peer_discovery_etcd_app','rabbitmq_peer_discovery_etcd_sup','rabbitmq_peer_discovery_etcd_v3_client']},
	{registered, [rabbitmq_peer_discovery_etcd_sup]},
	{applications, [kernel,stdlib,rabbit_common,rabbitmq_peer_discovery_common,rabbit,eetcd,gun]},
	{mod, {rabbitmq_peer_discovery_etcd_app, []}},
	{env, []}
]}.