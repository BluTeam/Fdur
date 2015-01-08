# encoding utf-8

::CarrierWave.configure do |config|
  config.storage           = :qiniu
  config.qiniu_access_key  =  "2xPsGXVFj898q5iVHmpiXdDtla_L-exGsojoTakk"
  config.qiniu_secret_key  =  "XNuNyauP94o_V9Fdwg8KJYxbVhSOYsynowi5t683"
  config.qiniu_bucket      =  "fdur"
  config.qiniu_bucket_domain =  "fdur.qiniudn.com"
  config.qiniu_bucket_private = false
  config.qiniu_block_size  = 10*1024*1024
  config.qiniu_protocol    = "http"
end