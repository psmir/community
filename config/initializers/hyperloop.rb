# config/initializers/hyperloop.rb
# If you are not using ActionCable, see http://ruby-hyperloop.io/docs/models/configuring-transport/
Hyperloop.configuration do |config|
  helper = Webpacker::Helper
  config.transport = :action_cable
  # config.import File.basename(Webpacker.manifest.lookup!('client_and_server.js'))
  # config.import File.basename(Webpacker.manifest.lookup!('client_only.js'))
  config.import 'reactrb/auto-import'
  config.import 'opal_hot_reloader'
  #config.console_auto_start = false

end

