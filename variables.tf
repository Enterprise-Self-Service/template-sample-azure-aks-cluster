variable "region" {
    type = string
    default = "West Europe"
    description = "Where would you like to deploy your cluster?"
}

variable "cluster_name" {
    type = string
    description = "What would you like your cluster to be?"
}
