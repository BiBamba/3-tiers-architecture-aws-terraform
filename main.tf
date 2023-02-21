terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "4.51.0"
    }
  }
}

provider "aws" {
  region = "us-east-1"
}

module "network" {
  source = "./modules/network"

  vpc_cidr_block              = var.vpc_cidr_block
  private_subnet01_cidr_block = var.private_subnet01_cidr_block
  private_subnet02_cidr_block = var.private_subnet02_cidr_block
  public_subnet01_cidr_block  = var.public_subnet01_cidr_block
  public_subnet02_cidr_block  = var.public_subnet02_cidr_block
  availability_zone_01        = var.availability_zones_01
  availability_zone_02        = var.availability_zones_02
}

module "security" {
  source = "./modules/security"

  vpc_id          = module.network.main_vpc_id
  front_elb_sg_id = module.web.front_lb_id
}

module "web" {
  source = "./modules/web"

  // Network Components
  vpc_id              = module.network.main_vpc_id
  public_subnet01_id  = module.network.public_subnet01_id
  public_subnet02_id  = module.network.public_subnet02_id
  private_subnet01_id = module.network.private_subnet01_id
  private_subnet02_id = module.network.private_subnet02_id

  // Web Components
  front_lb_name        = var.alb_name
  front_lb_tgrp_name   = var.alb_tgrp_name
  image_id             = var.image_id
  instance_type        = var.instance_type
  web_availabily_zones = var.availability_zones
  web_desired_capacity = var.desired_number
  web_max_size         = var.max_number
  web_min_size         = var.min_number

  // Security Groups
  client_servers_sg_id = module.security.client_servers_sg_id
  front_elb_sg_id      = module.security.front_elb_sg_id
}

# App Module
module "appserver" {
  source = "./modules/app"

  vpc_id                    = module.network.main_vpc_id
  private_subnet01_id       = module.network.private_subnet01_id
  private_subnet02_id       = module.network.private_subnet02_id
  app_launch_template_sg_id = module.security.app_launch_template_sg_id
  internal_lb_sg_id         = module.security.inernal_lb_sg_id

  # APP Servers Components
  app_servers_image_id         = var.image_id
  app_servers_instance_type    = var.instance_type
  app_availability_zones       = var.availability_zones
  app_servers_desired_capacity = var.desired_number
  app_servers_max_size         = var.max_number
  app_servers_min_size         = var.min_number
}