require_relative 'docking_station'
require_relative 'bike'
require_relative 'garage'

class Van
  attr_reader :stored_bikes

  def initialize
    @stored_bikes = []
  end

  def take_broken_bikes(station)
    @stored_bikes = station.docked_bikes.reject { |bike| bike.working? }
  end

end
