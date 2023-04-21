resource "aws_instance" "Website" {
  ami = "ami-06e46074ae430fba6"
  count = var.num_ec2
  instance_type = var.instance_type
  tags = {
    Name = "${var.instance_name}-${count.index}"
  }
}