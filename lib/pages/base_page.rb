require 'spec_helper'

class BasePage

  include Capybara::DSL

  def initialize
    visit '/'
  end

  def ui
    @ui
  end

end
