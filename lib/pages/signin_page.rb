require 'spec_helper'

class SignInPage < BasePage

  include Capybara::DSL

  def sign_in(username, password)
    open_app
    puts "Signing In to Amazon..."
  end

end
