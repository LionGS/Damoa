# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( ie/html5shiv.js )
Rails.application.config.assets.precompile += %w( ie/respond.min.js )
Rails.application.config.assets.precompile += %w( main.scss )
Rails.application.config.assets.precompile += %w( ie9.scss )
Rails.application.config.assets.precompile += %w( ie8.scss )
Rails.application.config.assets.precompile += %w( jquery.min.js )
Rails.application.config.assets.precompile += %w( skel.min.js )
Rails.application.config.assets.precompile += %w( util.js )
Rails.application.config.assets.precompile += %w( main.js )
Rails.application.config.assets.precompile += %w( font-awesome.min.css )
Rails.application.config.assets.precompile << /\.(?:svg|eot|woff|ttf)\z/