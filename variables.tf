# --- compute/variables.tf ---

variable "username" {
  type = string
  description = "Používateľské meno pre autentifikáciu."
}

variable "password" {
  type = string
  description = "Heslo pre autentifikáciu."
}

variable "tenant_name" {
  type = string
  description = "Názov projektu alebo tenantu v cloudovom prostredí."
}

variable "auth_url" {
  type = string
  description = "URL adresa"
}

variable "key_name" {
  type = string
  description = "Názov kľúča pre pripájanie k inštanciám."
}

variable "create_key" {
  type = bool
  description = "Určuje, či sa má vytvoriť nový kľúč pri pripájaní k inštanciám."
}

variable "bastion_userdata" {
  type = string
  description = "dáta pre inicializáciu bastion inštancie."
}

variable "minikube_userdata" {
  type = string
  description = "dáta pre inicializáciu Minikube inštancie."
}
