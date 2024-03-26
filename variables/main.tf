variable "vpcName" {
    type = string
    default = "myvpcvariable"
}

variable "sshport" {
    type = number
    default = 22
}

variable "enabled" {
    default = true
}

variable "mylist"{
    type = list(string)
    default = ["value1","value2"]
}

variable "mymap"  {
    type = map
    default = {
        key1 = "value1"
        key2 = "value2"
    }
}

variable "inputname" {
    type =string
    description = "set the name of the vpc"
}

resource "aws_vpc" "myvpc1" {
  cidr_block = "10.0.0.0/16"

  tags = {
    //Name = var.vpcName
    //Name = var.mylist[0]
   // Name = var.mymap["Key1"]
    Name = var.inputname

  }
}

output "vpcidmyoutput" {
    value = aws_vpc.myvpc1.id
}

variable "mytuple" {
    type = tuple([string, number, string])
    default = ["cat", 1, "dog"]
}

variable "mybject" {
    type = object({
      name = string, port = list(number)
    })
    default = {
        name = "TJ"
        port = [22, 25, 80]
    }
    }
