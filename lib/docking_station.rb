require_relative 'bike'
require_relative 'van'
require_relative 'garage'

class DockingStation
  attr_reader :capacity
  attr_accessor :docked_bikes

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

  def release_broken_bikes(van)
    van.take_broken_bikes
    @docked_bikes.reject! { |bike| bike.working? == false }
  end

  private

  def full?
    @docked_bikes.count >= DEFAULT_CAPACITY
  end

  def empty?
    @docked_bikes.empty?
  end

end
