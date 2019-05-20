unless Rails.application.config.respond_to?(:base_email)
  Rails.application.config.base_email = "no-reply@onepx.com"
end