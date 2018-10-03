require_relative 'bike.rb'

class DockingStation
  attr_reader :docked_bikes

  def release_bike
    raise "There are no bikes" unless @docked_bikes
    @docked_bikes
  end

  def dock(bike)
    raise "Bike already docked" if @docked_bikes
    @docked_bikes = bike
  end
end
