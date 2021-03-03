# README

1. start zookeeper

From this root folder of your kafka installation.

```bash
$ bin/zookeeper-server-start.sh config/zookeeper.properties
```

2. start kafka

From this root folder of your kafka installation.

```bash
$ bin/kafka-server-start.sh config/server.properties
```

3. make sure you have "events_commands" topic created

Note: if you have already done it, don't do it again.

From this root folder of your kafka installation.

```bash
$ bin/kafka-topics.sh --create --topic events_commands --bootstrap-server localhost:9092
```   

4. make sure you have "events_facts" topic created

Note: if you have already done it, don't do it again.

From this root folder of your kafka installation.

```bash
$ bin/kafka-topics.sh --create --topic events_facts --bootstrap-server localhost:9092
```   

5. start console consumer for "events_commands" topic

From this root folder of your kafka installation.

```bash
$. bin/kafka-console-consumer.sh --topic events_commands --from-beginning --bootstrap-server localhost:9092
```

5. start console consumer for "events_facts" topic

From this root folder of your kafka installation.

```bash
$. bin/kafka-console-consumer.sh --topic events_facts --from-beginning --bootstrap-server localhost:9092
```

6. start events server

From this root folder of this repo.

```bash
$ ./start-events-server.sh
```
