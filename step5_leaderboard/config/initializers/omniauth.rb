OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '1749664828669206', '6c93236b3b51a69729708189eed5e56c', {:client_options => {:ssl => {:ca_file => Rails.root.join("cacert.pem").to_s}}}
end