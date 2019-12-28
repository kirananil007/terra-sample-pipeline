resource "aws_vpc" "mainvpc" {
    cidr_block = "10.0.0.0/16"
    instance_tenancy = "default"
    enable_dns_hostnames = true
    tags = {
        Name = "TET-KIRAN-TERAVPC"
    }
}

resource "aws_security_group" "allow_ssh" {
    name = "allow_ssh"
    description = "Allow all SSH inbound traffic/Allow all outbound traffic"
    vpc_id = "${aws_vpc.mainvpc.id}"

    ingress{
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress{
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }
    tags = {
        Name = "TET-KIRAN-TERASecurityGroup"
    }
}

resource "aws_internet_gateway" "gw" {
    vpc_id = "${aws_vpc.mainvpc.id}"

    tags = {
        Name = "TET-KIRAN-TERAIGW"
    }
}

resource "aws_eip" "EIP" {
    vpc = true
    tags = {
        Name = "TET-TERA-EIP"
    }
  
}

resource "aws_nat_gateway" "NATGW" {
    allocation_id = "${aws_eip.EIP.id}"
    subnet_id = "${aws_subnet.PublicSubnet_A.id}"
    tags = {
        Name = "TET-KIRAN-TERA-NATGW"
    }
}

