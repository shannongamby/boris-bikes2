require_relative 'bike.rb'

class DockingStation
  attr_reader :docked_bikes, :capacity

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @docked_bikes = []
    @capacity = capacity
  end

  def release_bike
    raise "There are no bikes" if empty?
    raise "This bike is not working!" unless @docked_bikes.last.working?
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
