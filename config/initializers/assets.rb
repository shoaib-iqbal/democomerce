# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'
Rails.application.config.assets.precompile += %w( all_frontend.css )

Rails.application.config.assets.precompile += %w( select2.min.js )

Rails.application.config.assets.precompile += %w( all_frontend.js )
Rails.application.config.assets.precompile += %w( admin.css )
Rails.application.config.assets.precompile += %w( all_admin.js )
Rails.application.config.assets.precompile += %w( select2.min.js )
Rails.application.config.assets.precompile += %w( frontend/modernizr-2.8.3.min.js )
# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
