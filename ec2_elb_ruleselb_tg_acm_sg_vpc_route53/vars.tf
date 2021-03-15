variable ami {
  type        = string
  default     = "ami-0ff8a91507f77f867"
  description = "description"
}

variable instance_type {
  type        = string
  default     = "t2.small"
  description = "description"
}

variable domain_name {
  type        = string
  default     = "ingaia.com.br"
  description = "description"
}

variable allow_ip {
  type        = string
  default     = "0.0.0.0/24"
  description = "description"
}

variable endpoint {
  type        = string
  default     = "testterraform.ingaia.com.br"
  description = "description"
}

variable  region {
  type        = string
  default     = "us-east-1"
  description = "description"
}

variable  profile {
  type        = string
  default     = "default"
  description = "description"
}

variable  versionProvider{
  type        = string
  default     = "2.7"
  description = "description"
}