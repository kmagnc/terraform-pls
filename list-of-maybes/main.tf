module "a" {
  source = "./modules/a"
  count = 1
}

module "b" {
  source = "./modules/b"
  count = 0
}

module "c" {
  source = "./modules/c"
  count = 0
}

locals {
    somelist = compact([
        try( module.a[0].something, ""), 
        try( module.b[0].something, ""), 
        try( module.c[0].something, "")
    ])
}

output "final-list" {
  value = local.somelist
}