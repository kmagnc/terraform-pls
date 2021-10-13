# Terraform, please: List of maybes


## The problem
- We want to create some list from outputs in local modules, but not all modules may run
- We do not want empty strings in the list

## The solution
- Create list
- Attempt to add each module's output, fallback on empty string
- Remove empty strings

## Usage
```
  terraform init
  terraform apply -auto-approve
```

## Input
```
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
```


## Output
```
  Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

  Outputs:

  final-list = tolist([
    "something-a",
  ])
```