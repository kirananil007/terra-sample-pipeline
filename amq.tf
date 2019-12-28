resource "aws_mq_broker" "benchmarktest" {
  broker_name = "TET-KIRAN-TERAMQ"

  configuration {
    id       = "${aws_mq_configuration.test.id}"
    revision = "${aws_mq_configuration.test.latest_revision}"
  }
  deployment_mode    = "SINGLE_INSTANCE"
  engine_type        = "ActiveMQ"
  engine_version     = "5.15.0"
  host_instance_type = "mq.t2.micro"  
  security_groups    = ["${aws_security_group.allow_ssh.id}"]
  subnet_ids         = ["${aws_subnet.PublicSubnet_A.id}"]

  user {
    username = "ExampleUser"
    password = "MindTheGap"
  }
}

resource "aws_mq_configuration" "benchmarktest" {
  description    = "Example benchmarktest Configuration"
  name           = "benchmarktest"
  engine_type    = "ActiveMQ"
  engine_version = "5.15.0"

  data = <<DATA
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<broker xmlns="http://activemq.apache.org/schema/core">
  <plugins>
    <forcePersistencyModeBrokerPlugin persistenceFlag="true"/>
    <statisticsBrokerPlugin/>
    <timeStampingBrokerPlugin ttlCeiling="86400000" zeroExpirationOverride="86400000"/>
  </plugins>
</broker>
DATA
}