output "vpc_id" {
  value = module.network.main_vpc_id
}

output "frontend_load_lalancer_id" {
  value = module.web.front_lb_id
}