require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require( *Rails.groups )

module Jury
  class Application < Rails::Application
    # config.time_zone = 'Central Time (US & Canada)'
    # config.i18n.default_locale = :de
    config.active_record.raise_in_transactional_callbacks = true
  end
end
