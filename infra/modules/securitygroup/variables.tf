variable "sg_name" {
  description = "Name of the Security group"
  type        = string
}

variable "rule_name" {
  description = "Name of the Security Group Rule"
  type        = string
  
}

variable "priority" {
  description = "Priority of the rule"
  type        = number
  
}

variable "direction" {
  description = "Direction of the rule: Inbound or Outbound"
  type        = string
}

variable "access" {
  description = "Access of the rule: Allow or Deny"
  type        = string
  
}

variable "source_cidrs" {
  description = "List of CIDR blocks for the source"
  type        = list(string)

}

variable "sg_description" {
  description = "Description of the Security Group"
  type        = string
  default     = ""
}

variable "environment" {
  description = "Environment to be installed"
  type        = string
}

variable "type" {
  description = "Type INGRESS or EGRESS"
  type        = string
  default     = "INGRESS"
}

variable "from_port" {
  description = "Allowing Traffic From Port"
  type        = number
}

variable "to_port" {
  description = "Allowing Traffic To Port"
  type        = number
}

variable "protocol" {
  description = "Protocol TCP/ICMP/UDP"
  type        = string
  default     = "tcp"
}

variable "cidr_blocks" {
  description = "CIDR Blocks to allow traffic to in case of egress/from in case of ingress"
  type        = list(string)
}









