require_relative 'boot'

require 'rails/all'

Bundler.require(*Rails.groups)

module ADE
  class Application < Rails::Application
    # Use the responders controller from the responders gem
    config.app_generators.scaffold_controller :responders_controller

    config.i18n.default_locale = :"pt-BR"
  end
end
