provider "local" {}

resource "local_file" "hello" {
    filename = "hello_world!.txt"
    content = "terraform test"
}