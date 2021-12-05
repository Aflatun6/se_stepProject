resource "aws_eip" "eip-a" {
  vpc = true
}
//Creating elastic ip for subnet - B
resource "aws_eip" "eip-b" {
  vpc = true
}