require 'docking_station'
require 'pry'

describe DockingStation do
  let(:bike) { double :bike }

  it 'successfully creates a new DockingStation instance' do
    expect(subject).to be_an_instance_of(DockingStation)
  end

  it { is_expected.to respond_to(:release_bike) }

  it 'releases a "working" bikes' do
    allow(bike).to receive(:working?).and_return(true)
    station = subject
    station.dock(bike)
    expect(station.release_bike).to be_working
  end

  it { is_expected.to respond_to(:dock) }

  it 'docks a bike' do
    expect(subject.dock(bike)).to eq "#{bike} successfully docked"
  end

  it 'shows bikes that have been docked to it' do
    station = subject
    station.dock(bike)
    expect(station.docked_bikes).to eq [bike]
  end

  it 'raises an error when there are no bikes at the docking station' do
    expect { subject.release_bike }.to raise_error("There are no bikes")
  end

  it 'allows for multiple bikes to be docked' do
    station = subject
    3.times { station.dock(bike) }
    expect(station.dock(bike)).to eq "#{bike} successfully docked"
  end

  it 'raises an error if a bike is docked after the station is full' do
    station = subject
    station.capacity.times { station.dock(bike) }
    expect { station.dock(bike) }.to raise_error("Dock full")
  end

  it 'allows the user to specify a default capacity' do
    station = DockingStation.new(30)
    expect(station).to eq station
  end

  it 'has a capacity of 20 when no capacity is specified' do
    expect(subject.capacity).to eq 20
  end

  it 'does not release a broken bike' do
    allow(bike).to receive(:working?).and_return(false)
    station = subject
    station.dock(bike)
    expect { station.release_bike }.to raise_error("This bike is not working!")
  end

  it 'allows a broken bike to be docked' do
    allow(bike).to receive(:report_as_broken).and_return("Thank you for reporting a broken bike.")
    bike.report_as_broken
    expect(subject.dock(bike)).to eq "#{bike} successfully docked"
  end

end
