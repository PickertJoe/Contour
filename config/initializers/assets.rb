# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = "1.0"

class AssetUrlProcessor
  def self.call(input)
    context = input[:environment].context_class.new(input)
    data = input[:data].gsub(/asset-url\(["']?(.+?)["']?\)/) do |_match|
      "url(#{context.asset_path($1)})"
    end
    {data: data}
  end
end

Sprockets.register_postprocessor "text/css", AssetUrlProcessor

# Add additional assets to the asset load path.
# Rails.application.config.assets.paths << Emoji.images_path

# Add node_modules folder to the asset load path, its location has been
# customized due to what's set in .yarnrc.
Rails.application.config.assets.paths << "/node_modules"

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in the app/assets
# folder are already added.
# Rails.application.config.assets.precompile += %w( admin.js admin.css )
