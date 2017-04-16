require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module TestVideo
  class Application < Rails::Application
    # config.eager_load_paths += [
    #   "#{config.root}/lib/workers",
    # ]
    # config.autoload_paths += Dir[Rails.root.join('app', 'services', '*')]
  end
end
