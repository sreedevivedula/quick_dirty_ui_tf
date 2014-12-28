require 'capybara/rspec'
require 'rspec/expectations'
require 'singleton'

Dir[File.dirname(__FILE__) + '/../lib/pages/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/../lib/page_objects/*.rb'].each {|file| require file }
Dir[File.dirname(__FILE__) + '/../lib/page_uis/*.rb'].each {|file| require file }


Capybara.register_driver :selenium do |app|
  driver = Capybara::Selenium::Driver.new(app, :browser => :firefox)
  driver.browser.manage.window.resize_to(1600, 1200)
  driver
end


Capybara.configure do |c|
  c.default_driver = :selenium
  c.app_host = "http://amazon.in"
  c.default_wait_time = 10
end

RSpec.configure do |config|

  config.before(:all) do
    @home_page = HomePage.new
  end

end
