terraform{
    backend "s3" {
        bucket = "mirepoparaterraform"
        encrypt = true
        key = "terraform2.tfstate"
        region = "us-east-1"
    }
}

provider "aws" {
    region = "us-east-1"
}
