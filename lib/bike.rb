require_relative 'docking_station.rb'
require_relative 'garage'
require_relative 'van'

class Bike

  def initialize
    @working = true
  end

  def report_as_broken
    @working = false
    "Thank you for reporting a broken bike."
  end

  def working?
    @working
  end

end
