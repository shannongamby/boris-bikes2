require 'docking_station.rb'

describe DockingStation do

  it 'successfully creates a new DockingStation instance' do
    expect(subject).to be_an_instance_of(DockingStation)
  end

  it { is_expected.to respond_to(:release_bike) }

  it 'releases a "working" bikes' do
    station = subject
    station.dock(Bike.new)
    bike = station.release_bike
    expect(bike).to be_working
  end

  it { is_expected.to respond_to(:dock) }

  it 'docks a bike' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq "#{bike} successfully docked"
  end

  it 'shows bikes that have been docked to it' do
    bike = Bike.new
    station = subject
    station.dock(bike)
    expect(station.docked_bikes).to eq [bike]
  end

  it 'raises an error when there are no bikes at the docking station' do
    expect { subject.release_bike }.to raise_error("There are no bikes")
  end

  it 'allows for up to 20 bikes to be docked' do
    station = subject
    bike = Bike.new
    described_class::DEFAULT_CAPACITY - 1.times { station.dock(bike) }
    expect(station.dock(bike)).to eq "#{bike} successfully docked"
  end

  it 'raises an error if more than 20 bikes are docked' do
    station = subject
    described_class::DEFAULT_CAPACITY.times { station.dock(Bike.new) }
    expect { station.dock(Bike.new) }.to raise_error("Dock full")
  end

end
