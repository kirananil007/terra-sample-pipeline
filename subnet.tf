resource "aws_subnet" "PublicSubnet_A" {
    vpc_id = "${aws_vpc.mainvpc.id}"
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags = {
        Name = "TET-KIRAN-TERAAMQ-PUBSUBNET"
    }
    depends_on = ["${aws_vpc.mainvpc}"]  
}

resource "aws_subnet" "PrivateSubnet_A" {
    vpc_id = "${aws_vpc.mainvpc.id}"
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"
    map_public_ip_on_launch = true
    tags = {
        Name = "TET-KIRAN-TERAAMQ-PRIVSUBNET"
    }
    depends_on = ["${aws_vpc.mainvpc}"]  
}