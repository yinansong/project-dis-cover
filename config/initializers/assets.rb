# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

Rails.application.config.assets.precompile += %w( monologue/foundation_icons/social_foundicons.eot )
Rails.application.config.assets.precompile += %w( monologue/foundation_icons/social_foundicons.woff )
Rails.application.config.assets.precompile += %w( monologue/foundation_icons/social_foundicons.ttf )

Rails.application.config.assets.precompile += %w( jquery.Jcrop.css )
Rails.application.config.assets.precompile += %w( jquery.Jcrop.min.js )

Rails.application.config.assets.precompile += %w( jquery.Jcrop.js )
Rails.application.config.assets.precompile += %w( jquery-1.11.2.min.js )
