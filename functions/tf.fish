function tf --description 'wrapper for terraform'
  switch $argv[1]
  case "a" "apply"
    terraform apply $argv[2..-1]
  case "p" "plan"
    terraform plan $argv[2..-1]
  case "po"
    terraform plan --out $argv[2..-1]
  case "s" "state"
    switch $argv[2]
    case "l" "list"
      terraform state list $argv[3..-1]
    case "m" "mv" "move"
      terraform state mv $argv[3..-1]
    case "pl" "pull"
      terraform state pull $argv[3..-1]
    case "ps" "push"
      terraform state push $argv[3..-1]
    case "r" "rm"
      terraform state rm $argv[3..-1]
    case "s" "show"
      terraform state show $argv[3..-1]
    end
  case "ss"
    terraform state show $argv[2..-1]
  case "sl"
    terraform state list $argv[2..-1]
  case "f" "fmt"
    terraform fmt $argv[2..-1]
  case "i" "init"
    terraform init $argv[2..-1]
  case "w" "work" "workspace"
    switch $argv[2]
    case "n" "new"
      terraform workspace new $argv[3..-1]
    case "l" "list"
      terraform workspace list $argv[3..-1]
    case "d" "del" "delete"
      terraform workspace delete $argv[3..-1]
    case "co" "ch" "sel" "select"
      terraform workspace select $argv[3..-1]
    case "s" "sh" "show"
      terraform workspace show $argv[3..-1]
    end
  case "wc"
    terraform workspace select $argv[2..-1]
  case "ws"
    terraform workspace show $argv[2..-1]
  case "wl"
    terraform workspace list $argv[2..-1]
  case "v" "ver" "version"
    terraform version $argv[2..-1]
  case "va" "val" "validate"
    terraform validate $argv[2..-1]
  case "clean"
    rm -rf .terraform
    rm -f *.plan
  end
end