require 'van'

describe Van do
  let(:station) {double :station}
  it 'successfully creates a new Van instance' do
    expect(subject).to be_an_instance_of(Van)
  end

  it 'should have a container object for storing bikes' do
    expect(subject.stored_bikes).to eq []
  end

  it { is_expected.to respond_to(:take_broken_bikes) }

  it 'should be able to take broken bikes from a station' do
    van = subject
    test_station = DockingStation.new
    working_bike = Bike.new
    broken_bike = Bike.new
    broken_bike.report_as_broken
    test_station.dock(working_bike)
    test_station.dock(broken_bike)
    van.take_broken_bikes(test_station)
    expect(van.stored_bikes).not_to be_empty
  end
end
