output "how_to_get_argocd_user_and_password" {
  value = "Default user is 'admin' and to exec 'kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath='{.data.password}' | base64 -d' to get the password."
}