require_relative 'bike.rb'

class DockingStation
  attr_reader :docked_bikes

  def initialize
    @docked_bikes = []
  end

  def release_bike
    raise "There are no bikes" if @docked_bikes.empty?
    @docked_bikes.pop
  end

  def dock(bike)
    raise "Dock full" if @docked_bikes.count >= 20
    @docked_bikes << bike
    "#{bike} successfully docked"
  end
end
