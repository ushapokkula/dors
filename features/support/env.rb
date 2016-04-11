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
require 'report_builder'
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
require_relative 'misc'
include RSpec:: Matchers
include Misc
$users = load_yaml_file('../config/users')

TRAINER_USERNAME =
TRAINER_PASSWORD =

ASSESSOR_USERNAME= "sudiv"
ASSESSOR_PASSWORD= "P@ssw0rd1"

ASSESSOR_USERNAME1= "johnny"
ASSESSOR_PASSWORD1= "P@ssw0rd"

COMPLAINCE_USERNAME= "jane1"
COMPLAINCE_PASSWORD= "P@ssw0rd"

$Trainers_Link="https://systest.trainer.dors.wtg.co.uk"




Capybara.configure do |config|

  config.default_driver = :debug
  config.app_host = "https://systest.trainer.dors.wtg.co.uk"
  # config.default_max_wait_time = 10
end
World(Capybara)

Capybara.register_driver :selenium do |app|
  http_client = Selenium::WebDriver::Remote::Http::Default.new
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.register_driver :debug do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.add_extension "features/support/firebug.xpi"
  profile.add_extension "features/support/firepath.xpi"
  Capybara::Selenium::Driver.new app, :profile => profile
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

