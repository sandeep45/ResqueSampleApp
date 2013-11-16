class Sandeep
  def self.matches?(request)
    return true if request.query_string.index "SANDEEP"
  end
end