require 'spec_helper'

class HeaderUI < PageComponent

  include Singleton

  def initialize
    super("header")
    _set_search
  end

  def _set_search
    self[:search_bar] = "#nav-searchbar"
    self[:search_bar][:search_in] = "#nav-search-in"
    self[:search_bar][:go] = ".nav-submit-input"
    self[:search_bar][:search_box] = "#twotabsearchtextbox"
  end

end