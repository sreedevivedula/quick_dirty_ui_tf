require 'spec_helper'

class HomePageUI < PageComponent

  include Singleton

  def initialize
    super("body")
    self[:header] = HeaderUI.instance
    self[:results_header] = ResultsHeader.instance
  end

end