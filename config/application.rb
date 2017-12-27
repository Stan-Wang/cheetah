require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cheetah
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.time_zone = 'Beijing'
    config.active_record.default_timezone = :local
    # config.api_only = true
    config.response_format = :json
    config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}').to_s]
    config.i18n.default_locale = 'zh-CN'
    config.generators do |g|
      g.assets false
      g.javascripts false
      g.resource_route false
      g.stylesheets false
      g.scaffold_stylesheet false
      g.template_engine :jbuilder
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
    end
    #需要配置自动识别时区的字段类型
    config.active_record.time_zone_aware_types = [:datetime,:time]

    #将 policies 目录放到 rails 的自动加载路径中
    config.autoload_paths << Rails.root.join('app/policies')
  end
end
