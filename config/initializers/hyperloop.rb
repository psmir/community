# config/initializers/hyperloop.rb
# If you are not using ActionCable, see http://ruby-hyperloop.io/docs/models/configuring-transport/
Hyperloop.configuration do |config|
  helper = Webpacker::Helper
  config.transport = :action_cable
  config.import 'reactrb/auto-import'
  config.import File.basename(Webpacker.manifest.lookup!('client_and_server.js'))
end

