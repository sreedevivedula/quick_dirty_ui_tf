require 'spec_helper'

class BasePage

  include Capybara::DSL

  def open_app
    visit '/'
  end

  def header
    @header
  end

end
