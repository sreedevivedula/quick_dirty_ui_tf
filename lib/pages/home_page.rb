require 'spec_helper'

class HomePage < BasePage

  include Capybara::DSL

  def initialize
    @header = Header.new
  end

  def header
    @header
  end

end
