variable "resource_group_name" {
  description = "Nazwa grupy zasobów"
  type        = string
}

variable "resource_location" {
  description = "Lokalizacja grupy zasobów"
  type        = string
}

variable "tags" {
  description = "Tagi przypisane do grupy zasobów"
  type        = map(string)
  default     = {}
}
