require "capybara/cucumber"
require "selenium-webdriver"
require "site_prism"
require_relative "screenshots.rb"
require_relative "page_helper.rb"
require "ffaker"
require "pry"

BROWSER = ENV["BROWSER"]
AMBIENTE = ENV["AMBIENTE"]

CONFIG = YAML.load_file(File.dirname(__FILE__) + "/ambientes/#{AMBIENTE}.yml")

World(Screenshots)
World(PagesObjects)

Capybara.register_driver :selenium do |app|
  if BROWSER.eql?("chrome")
    Capybara::Selenium::Driver.new(app, :browser => :chrome)
  elsif BROWSER.eql?("firefox")
    Capybara::Selenium::Driver.new(app, :browser => :firefox, :marionette => true)
  elsif BROWSER.eql?("ie")
    Capybara::Selenium::Driver.new(app, :browser => :internet_explorer)
  elsif BROWSER.eql?("safari")
    Capybara::Selenium::Driver.new(app, :browser => :safari)
  elsif BROWSER.eql?("poltergeist")
    options = {js_erros: false}
    Capybara::Poltergeist::Driver.new(app, options)
  elsif BROWSER.eql?("iphone")
    iphone6 = "Mozilla/5.0 (iPhone; CPU iPhone OS 9_1 like Mac OS X) AppleWebKit/601.1.46 (KHTML, like Gecko) Version/9.0 Mobile/13B143 Safari/601.1"
    Capybara::Selenium::Driver.new(app,
                                   browser: :chrome,
                                   #  port: 4442,
                                   switches: ["--window-size=360,640",
                                              "--user-agent='#{iphone6}'"])
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host = CONFIG["url_default"]
  config.default_max_wait_time = 10
end
