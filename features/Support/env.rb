require 'rubygems'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'rspec'
require 'rspec/expectations'
require 'rspec/matchers'
require 'capybara/rspec'
require 'cucumber'
# require 'json'
# require 'gmail'
# require 'orderly'
# require 'net/imap.rb'
require 'faker'
require 'active_support/core_ext/string/inflections'
# require 'httparty'
# require 'capybara-screenshot/cucumber'
# require 'capybara/poltergeist'
# require 'mysql2'
# require 'pg'
require 'sort'
#require 'TinyTDS'
#require 'time_difference'
require 'pry'
require 'date'

include RSpec:: Matchers


TRAINER_USERNAME =
TRAINER_PASSWORD =

ASSESSOR_USERNAME= "sudiv"
ASSESSOR_PASSWORD= "P@ssw0rd"

ASSESSOR_USERNAME1= "johnny"
ASSESSOR_PASSWORD1= "P@ssw0rd"

COMPLAINCE_USERNAME= "jane1"
COMPLAINCE_PASSWORD= "P@ssw0rd"

$Trainers_Link="https://systest.trainer.dors.wtg.co.uk"



Before do |scenario|
   page.driver.browser.manage.window.maximize
  @trainers=Trainers.new
  # @trainers_listing_page = LookupStatus.new
end

After do |scenario|
  if(scenario.failed?)
    #  page.driver.browser.save_screenshot("#{scenario.__id__}.png")
    page.save_screenshot("#{scenario.__id__}.png")
    embed("#{scenario.__id__}.png", "image/png", "SCREENSHOT")
  end
end


=begin

Capybara.default_driver = :poltergeist
Capybara.default_wait_time = 5
Capybara.app_host =


Capybara.javascript_driver = :poltergeist
options = { js_errors: false, timeout: 300, window_size: [1600, 2000], inspector:true, phantomjs_options: ['--load-images=yes', '--ignore-ssl-errors=yes', '--ssl-protocol=any'] }

Capybara.register_driver(:poltergeist) do |app|
  Capybara::Poltergeist::Driver.new app, options
end

SitePrism.configure do |config|
  config.use_implicit_waits = true
end

=end

Capybara.configure do |config|

  config.default_driver = :selenium
  config.app_host = "https://systest.trainer.dors.wtg.co.uk"
  config.default_max_wait_time = 15
end
World(Capybara)

Capybara.register_driver :selenium do |app|
  http_client = Selenium::WebDriver::Remote::Http::Default.new
  http_client.timeout = 100
  #Capybara::Selenium::Driver.new(app, :browser => :chrome, :http_client => http_client, :switches => %w[--test-type] )
  #Capybara::Selenium::Driver.new(app, :browser => :ie, :http_client => http_client, :switches => %w[--test-type] )
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.server_port = 8888 + ENV['TEST_ENV_NUMBER'].to_i

class Capybara::Selenium::Driver < Capybara::Driver::Base
  def reset!
    if @browser
      begin
      rescue Selenium::WebDriver::Error::UnhandledError => e
      end
      @browser.navigate.to('about:blank')
    end
  end
end

SitePrism.configure do |config|
  config.use_implicit_waits = true
end

