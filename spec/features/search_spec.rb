require 'spec_helper'

feature "Search for Books" do

  scenario "User should be able to search for a title in books",
           :smoke => true,
           :positive => true do

    search_str = "The Woman's Yoga Book"
    @home_page.header.search(search_str)
    expect(@home_page.ui[:results_header][:result_count].f.text).to match(/[\d]-[\d]+ of [\d]+ results for \"#{search_str}\"/)

  end

end
