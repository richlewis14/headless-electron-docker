require 'capybara/cucumber'
require 'selenium-webdriver'
require 'pry'

DRIVER = ENV['DRIVER'] || 'chrome'

Capybara.javascript_driver = DRIVER.to_sym
Capybara.default_driver = DRIVER.to_sym
Capybara.ignore_hidden_elements = false


Capybara.register_driver :chrome do |app|
  capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
    "chromeOptions" => {
      "binary" => Dir.pwd + '/node_modules/electron/dist/electron'
    }
  )
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :desired_capabilities => capabilities)
end

Before do
  visit 'file://' + Dir.pwd + '/index.html'
  sleep(2)
end
