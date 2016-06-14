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
require 'faker'
require 'active_support/core_ext/string/inflections'
require 'sort'
require 'pry'
require 'waitutil'
require 'date'
require 'time'
require_relative 'misc'
include RSpec:: Matchers
include Misc

$users = load_yaml_file('../config/users')

Capybara.configure do |config|
  config.default_driver = :debug
  config.app_host = "https://auto.trainer.dors.wtg.co.uk"
  config.default_max_wait_time = 20
end


World(Capybara)

Capybara.register_driver :selenium do |app|
  Selenium::WebDriver::Remote::Http::Default.new
  Capybara::Selenium::Driver.new(app, :browser => :firefox)
end

Capybara.register_driver :debug do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.add_extension "features/support/firebug.xpi"
  profile.add_extension "features/support/firepath.xpi"
  Capybara::Selenium::Driver.new app, :profile => profile
end

SitePrism.configure do |config|
  config.use_implicit_waits = true
end

