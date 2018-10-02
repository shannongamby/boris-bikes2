require_relative 'bike.rb'

class DockingStation
  attr_reader :docked_bikes

  def release_bike
    Bike.new
  end

  def dock(bike)
    @docked_bikes = bike
  end
end
