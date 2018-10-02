require 'docking_station.rb'

describe DockingStation do

  before :all do
    @docking_station = DockingStation.new
    @bike1 = Bike.new
  end

  it 'successfully creates a new DockingStation instance' do
    expect(subject).to be_an_instance_of(DockingStation)
  end

  it { is_expected.to respond_to(:release_bike) }

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock) }

  it 'docks a bike' do
    expect(subject.dock(Bike.new)).to be_an_instance_of(Bike)
  end

  it 'shows bikes that have been docked to it' do
    @docking_station.dock(@bike1)
    expect(@docking_station.docked_bikes).to eq(@bike1)
  end

end
