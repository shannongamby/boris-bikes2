require 'docking_station.rb'

describe DockingStation do

  before :all do
    @docking_station = DockingStation.new
    @bike1 = Bike.new
    @docking_station.dock(@bike1)
  end

  it 'successfully creates a new DockingStation instance' do
    expect(subject).to be_an_instance_of(DockingStation)
  end

  it { is_expected.to respond_to(:release_bike) }

  it 'releases a "working" bikes' do
    bike = @docking_station.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock) }

  it 'docks a bike' do
    expect(subject.dock(Bike.new)).to be_an_instance_of(Bike)
  end

  it 'shows bikes that have been docked to it' do
    expect(@docking_station.docked_bikes).to eq(@bike1)
  end

  it 'raises an error when there are no bikes at the docking station' do
    @new_ds = DockingStation.new
    expect { @new_ds.release_bike }.to raise_error("There are no bikes")
  end

  it 'raises an error when more than one bike is docked' do
    expect { @docking_station.dock(Bike.new) }.to raise_error("Bike already docked")
  end
end
