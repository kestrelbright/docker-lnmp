{application, 'rabbitmq_aws', [
	{description, "A minimalistic AWS API interface used by rabbitmq-autocluster (3.6.x) and other RabbitMQ plugins"},
	{vsn, "3.10.5"},
	{id, "v3.10.4-9-g8d4b3a4"},
	{modules, ['rabbitmq_aws','rabbitmq_aws_app','rabbitmq_aws_config','rabbitmq_aws_json','rabbitmq_aws_sign','rabbitmq_aws_sup','rabbitmq_aws_urilib','rabbitmq_aws_xml']},
	{registered, [rabbitmq_aws_sup,rabbitmq_aws]},
	{applications, [kernel,stdlib,crypto,inets,ssl,xmerl]},
	{mod, {rabbitmq_aws_app, []}},
	{env, []}
]}.