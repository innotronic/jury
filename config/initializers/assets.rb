#
#
#

Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.precompile += %w( main.js )
Rails.application.config.assets.precompile += %w( contestants.js contestants.css )
Rails.application.config.assets.precompile += %w( judges.js )
Rails.application.config.assets.precompile += %w( categories.js )
Rails.application.config.assets.precompile += %w( scores.js )
Rails.application.config.assets.precompile += %w( jury.js jury.css )

# Rails.application.config.assets.paths << Emoji.images_path
