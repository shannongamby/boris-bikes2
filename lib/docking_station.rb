require_relative 'bike.rb'

class DockingStation
  attr_reader :docked_bikes

  DEFAULT_CAPACITY = 20

  def initialize
    @docked_bikes = []
  end

  def release_bike
    raise "There are no bikes" if empty?
    @docked_bikes.pop
  end

  def dock(bike)
    raise "Dock full" if full?
    @docked_bikes << bike
    "#{bike} successfully docked"
  end

  private

  def full?
    @docked_bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @docked_bikes.empty?
  end

end
