### REQUIRED

variable "team" {
  type        = string
  description = ""
}

variable "product" {
  type        = string
  description = ""
}

variable "environment" {
  type        = string
  description = ""
}

variable "bu" {
  type        = string
  description = ""
}

### OPTIONALS

variable "application" {
  type        = string
  default     = ""
  description = ""
}

variable "bu" {
  type        = string
  default     = ""
  description = ""
}

variable "resource" {
  type        = string
  default     = ""
  description = ""
}

variable "custom_tags" {
  type        = map(any)
  default     = {}
  description = ""
}

variable "name" {
  type        = string
  default     = null
  description = ""
}
