resource "aws_route_table" "PublicRouteTable" {
  vpc_id = "${aws_vpc.mainvpc.id}"
  route {
      cidr = "0.0.0.0/0"
      gateway_id = "${aws_internet_gateway.gw.id}"
  }
  tags = {
      Name = "TET-KIRAN-TERAAMQ_PUB_ROUTABLE"
  }
  depends_on = ["aws_vpc.mainvpc","aws_internet_gateway.gw"]
}

resource "aws_route_table_association" "public_route_table_assoc" {
    subnet_id = "${aws_subnet.PublicSubnet_A.id}"
    route_table_id = "${aws_route_table.PublicRouteTable.id}"
    depends_on = ["aws_subnet.PublicSubnet_A","aws_route_table.PublicRouteTable"]
  
}

resource "aws_route_table" "PrivateRouteTable" {
  vpc_id = "${aws_vpc.mainvpc.id}"
  route {
      cidr = "0.0.0.0/0"
      gateway_id = "${aws_nat_gateway.NATGW.id}"
  }
  tags = {
      Name = "TET-KIRAN-TERAAMQ_PRIV_ROUTABLE"
  }
  depends_on = ["aws_vpc.mainvpc","aws_internet_gateway.gw"]
}

resource "aws_route_table_association" "private_route_table_assoc" {
    subnet_id = "${aws_subnet.PrivateSubnet_A.id}"
    route_table_id = "${aws_route_table.PrivateRouteTable.id}"
    depends_on = ["aws_subnet.PrivateSubnet_A","aws_route_table.PrivateRouteTable"]
  
}