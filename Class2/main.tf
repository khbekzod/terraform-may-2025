resource "aws_key_pair" "deployer" {
  depends_on = [time_sleep.wait_30_seconds]
  key_name   = "bastion-key"
  public_key = file("~/.ssh/id_rsa.pub")
  }


resource "aws_s3_bucket" "example" {
  bucket = "kaizen-bekzodkh"
}

resource "aws_s3_object" "object" {
  depends_on = [aws_s3_bucket.example]
  bucket = "kaizen-bekzodkh"
  key    = "main.tf"
  source = "main.tf"
}

resource "time_sleep" "wait_30_seconds" {
  create_duration = "10s"
}