BlogApplication::Application.configure do
  # Settings specified here will take precedence over those in config/application.rb

  # Code is not reloaded between requests
  config.cache_classes = true

  # Full error reports are disabled and caching is turned on
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # Disable Rails's static asset server (Apache or nginx will already do this)
  config.serve_static_assets = false

  # Compress JavaScripts and CSS
  config.assets.compress = true

  # Don't fallback to assets pipeline if a precompiled asset is missed
  config.assets.compile = false

  # Precompile assets locally
  config.assets.initialize_on_precompile = false

  # Generate digests for assets URLs
  config.assets.digest = true

  # Precompile assets that aren't included in application.js or application.css
  config.assets.precompile += %w(active_admin mercury_page.js jquery-1.9.1.js jquery-1.7.js mercury.js mercury.css font-awesome-ie7.css font-awesome.css)

  # Enable locale fallbacks for I18n (makes lookups for any locale fall back to
  # the I18n.default_locale when a translation can not be found)
  config.i18n.fallbacks = true

  # Send deprecation notices to registered listeners
  config.active_support.deprecation = :notify

  # For AWS S3 image storing with paperclip
  config.paperclip_defaults = {
    storage: :s3,
    s3_protocol: 'http',
    url: ':s3_domain_url',
    path: '/:class/:attachment/:id_partition/:style/:filename',
    s3_credentials: {
      bucket: ENV['AWS_BUCKET'],
      access_key_id: ENV['AWS_ACCESS_KEY_ID'],
      secret_access_key: ENV['AWS_SECRET_ACCESS_KEY']
    },
    s3_headers: {'Cache-Control' => 'max-age=300000000, public', 'Expires' => 10.years.from_now.httpdate}
  }

end
