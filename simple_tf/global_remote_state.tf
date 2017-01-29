module "tf_remote_state" {
  source      = "../modules/remote_state"
  prefix      = "${var.prefix}"
  environment = "${var.environment}"
}
