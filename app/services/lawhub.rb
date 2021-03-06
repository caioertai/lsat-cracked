module Lawhub
  class << self
    attr_writer :config
  end

  def self.configure
    yield(config)
  end

  def self.config
    @config ||= Configuration.new
  end

  def self.credentials
    @credentials ||= Base64.encode64("#{config.client_id}:#{config.client_secret}").gsub("\n", '')
  end

  def self.scope
    "https://lawpathb2b.onmicrosoft.com/06b7d783-8a46-43de-a375-07059967cb3b/.default"
  end

  class Configuration
    def method_missing(method_name, *args)
      ivar_name = "@#{method_name}"
      ivar_value = instance_variable_get(ivar_name)
      return ivar_value if ivar_value

      cred_value = get_value(method_name)
      return instance_variable_set(ivar_name, cred_value) if cred_value

      super
    end

    def get_value(key)
      Rails.application.credentials.lawhub[key.to_sym]
    end
  end
end
