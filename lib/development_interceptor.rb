class DevelopmentInterceptor
  def self.delivering_email(message)
    message.to = ["development@onepx.com"]
  end
end
