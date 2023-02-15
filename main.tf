resource "aws_vpc" "myvpc-10000-16" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = " 🏗️ tf-git-deployment"
  }
}

resource "aws_internet_gateway" "tf_route_10_ig" {
  vpc_id = aws_vpc.myvpc-10000-16.id
  tags = {
    Name = "vpc_internet_gateway"
  }
}

resource "aws_subnet" "sub_pri_100480_20" {
  vpc_id                  = aws_vpc.myvpc-10000-16.id
  map_public_ip_on_launch = false
  cidr_block              = "10.0.48.0/20"
  availability_zone       = "eu-central-1a"
  tags = {
    Name = "sub_pri_100480_20"
  }
}

resource "aws_subnet" "sub_pub_10000_20" {
  vpc_id                  = aws_vpc.myvpc-10000-16.id
  map_public_ip_on_launch = false
  cidr_block              = "10.0.0.0/20"
  availability_zone       = "eu-central-1a"
  tags = {
    Name = "sub_pub_10000_20"
  }
}

resource "aws_subnet" "sub_pri_100640_20" {
  vpc_id                  = aws_vpc.myvpc-10000-16.id
  map_public_ip_on_launch = false
  cidr_block              = "10.0.64.0/20"
  availability_zone       = "eu-central-1b"
  tags = {
    Name = "sub_pri_100640_20"
  }
}


resource "aws_subnet" "sub_pub_100160_20" {
  vpc_id                  = aws_vpc.myvpc-10000-16.id
  map_public_ip_on_launch = false
  cidr_block              = "10.0.16.0/20"
  availability_zone       = "eu-central-1c"
  tags = {
    Name = "sub_pub_100160_20"
  }
}
resource "aws_subnet" "sub_pri_100800_20" {
  vpc_id                  = aws_vpc.myvpc-10000-16.id
  map_public_ip_on_launch = false
  cidr_block              = "10.0.80.0/20"
  availability_zone       = "eu-central-1c"
  tags = {
    Name = "sub_pri_100800_20"
  }
}

resource "aws_subnet" "sub_pub_100320_20" {
  vpc_id                  = aws_vpc.myvpc-10000-16.id
  map_public_ip_on_launch = false
  cidr_block              = "10.0.32.0/20"
  availability_zone       = "eu-central-1c"

  tags = {
    Name = "sub_pub_100320_20"
  }
}

resource "aws_route_table" "tf_route_10" {
  vpc_id = aws_vpc.myvpc-10000-16.id

  route {
    cidr_block     = "0.0.0.0/0"
    gateway_id     = aws_internet_gateway.tf_route_10_ig.id
  }

  tags = {
    Name = "tf_route_10"
  }
}
resource "aws_main_route_table_association" "aws_subnet-route_asso" {
  vpc_id         = aws_vpc.myvpc-10000-16.id
  route_table_id = aws_route_table.tf_route_10.id
}

resource "aws_route_table_association" "aws_sub_pri_100480_20" {
  subnet_id      = aws_subnet.sub_pri_100480_20.id
  route_table_id = aws_route_table.tf_route_10.id
}

resource "aws_route_table_association" "aws_sub_pub_10000_20" {
  subnet_id      = aws_subnet.sub_pub_10000_20.id
  route_table_id = aws_route_table.tf_route_10.id
}

resource "aws_route_table_association" "aws_sub_pri_100640_20" {
  subnet_id      = aws_subnet.sub_pri_100640_20.id
  route_table_id = aws_route_table.tf_route_10.id
}

resource "aws_route_table_association" "aws_sub_pub_100160_20" {
  subnet_id      = aws_subnet.sub_pub_100160_20.id
  route_table_id = aws_route_table.tf_route_10.id
}

resource "aws_route_table_association" "aws_sub_pri_100800_20" {
  subnet_id      = aws_subnet.sub_pri_100800_20.id
  route_table_id = aws_route_table.tf_route_10.id
}

resource "aws_route_table_association" "aws_sub_pub_100320_20" {
  subnet_id      = aws_subnet.sub_pub_100320_20.id
  route_table_id = aws_route_table.tf_route_10.id
}
