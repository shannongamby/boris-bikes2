require_relative 'bike.rb'

class DockingStation
  attr_reader :docked_bikes

  def release_bike
    if @docked_bikes == nil
      raise StandardError.new("There are no bikes")
    else
      return @docked_bikes
    end
  end

  def dock(bike)
    @docked_bikes = bike
  end
end
