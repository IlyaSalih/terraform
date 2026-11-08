resource "local_file" "hosts_templatefile" {
  content = templatefile("${path.module}/hosts.tftpl", {
    webservers = yandex_compute_instance.web             # count -> list
    databases  = values(yandex_compute_instance.db)      # for_each -> map, берём значения
    storage    = [yandex_compute_instance.storage]       # одиночный ресурс -> список из 1
  })

  filename = "${abspath(path.module)}/hosts.ini"
}
