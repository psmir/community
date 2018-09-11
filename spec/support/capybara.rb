require 'capybara/rspec'

Capybara.register_driver(:chrome) do |app|
  # Turn on browser logs
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    loggingPrefs: {
      browser: 'ALL'
    }
  )

  Capybara::Selenium::Driver.new(
    app,
    browser: :chrome,
    desired_capabilities: capabilities
  )
end

Capybara.default_driver = :chrome
Capybara.javascript_driver = :chrome
Capybara::Chromedriver::Logger::TestHooks.for_rspec!
Capybara.server = :puma


