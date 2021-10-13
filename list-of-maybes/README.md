# Terraform, please: List of maybes


## The problem
- We want to create some list from outputs in local modules, but not all modules may run
- We do not want empty strings in the list

## The solution
- Create list
- Attempt to add each module's output, fallback on empty string
- Remove empty strings