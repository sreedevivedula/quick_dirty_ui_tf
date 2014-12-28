require 'spec_helper'

class Header < BasePage

  def initialize
    @ui = HeaderUI.instance
  end

  def search(search_str)
    @ui[:search_bar][:search_in].f.set("Books")
    @ui[:search_bar][:search_box].f.set(search_str)
    @ui[:search_bar][:go].f.click
  end

end