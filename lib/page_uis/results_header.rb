class ResultsHeader < PageComponent

  include Singleton

  def initialize
    super("#searchTemplate")
    self[:result_count] = "#s-result-count"
  end

end