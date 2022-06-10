resource "aws_eip" "lb" {
  instance = [aws_instance.HelloWorld.id]
  vpc      = true
}