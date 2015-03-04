require 'spec_helper'

class ItemsSelectedPage < BasePage

  include Capybara::DSL

  def success_msg
    puts "The success message is ..."
    "The actual success message"
  end

end
