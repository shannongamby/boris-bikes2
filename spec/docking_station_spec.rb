require 'docking_station.rb'

describe DockingStation do
  it 'successfully creates a new DockingStation instance' do
    expect(DockingStation.new).to be_an_instance_of(DockingStation)
  end
end
