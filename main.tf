terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.51.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "network" {
  source = "./modules/network"
}

module "security" {
  source = "./modules/security"
}

module "web" {
  source = "./modules/web"

  front_lb = var.alb_name
  front_lb_tgrp = var.alb_tgrp_name
  web_lt_name_prefix = var.alb_launch_template_prefix
  image_id = var.image_id
  instance_type = var.instance_type
  web_availabily_zones = var.availability_zones
  web_desired_capacity = var.desired_number
  web_max_size = var.max_number
  web_min_size = var.min_number
}