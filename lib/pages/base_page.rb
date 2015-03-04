require 'spec_helper'

class BasePage

  include Capybara::DSL

  def initialize
    visit '/'
  end

end
