require 'spec_helper'

feature "Manage Shopping Cart" do

  scenario "User should be able to add items to shopping cart",
           :smoke => true,
           :positive => true do

    search_str = "A Gem for Women"
    @sign_in_page.sign_in("abcd", "xxxx")
    @home_page.header.search(search_str, "Books")
    @search_results.select_name_contains(search_str)
    expect(@items_selected_page.success_msg).to match("1 item was added to your cart")

  end

end
