require ::File.expand_path('../../config/environment',  __FILE__)
Rails.application.eager_load!
ActionCable.server.config.allowed_request_origins = ["http://127.0.0.1:3000"]
run ActionCable.server
