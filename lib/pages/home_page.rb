require 'spec_helper'

class HomePage < BasePage

  attr_accessor :header

  def initialize
    super()
    @header = Header.new
    @ui = HomePageUI.instance
  end

end