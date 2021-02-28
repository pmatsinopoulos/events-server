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

3. make sure you have "events" topic created

Note: if you have already done it, don't do it again.

From this root folder of your kafka installation.

```bash
$ bin/kafka-topics.sh --create --topic events --bootstrap-server localhost:9092
```   

4. start console consumer

From this root folder of your kafka installation.

```bash
4. bin/kafka-console-consumer.sh --topic events --from-beginning --bootstrap-server localhost:9092
```

5. start events server

From this root folder of this repo.

```bash
$ ./start-events-server.sh
```
