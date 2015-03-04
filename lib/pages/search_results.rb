require 'spec_helper'

class SearchResults < BasePage

  include Capybara::DSL

  def select_name_contains(part_name)
    puts "Selcting an item by a part of name..."
  end

end
