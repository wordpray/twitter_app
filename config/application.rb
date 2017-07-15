require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module TwitterApp
  class Application < Rails::Application
    config.generators do |g|
      g.javascripts false
      g.assets false
      g.test_framework false
    end

    config.i18n.default_locale = :ja
    config.action_view.embed_authenticity_token_in_remote_forms = true
  end
end
