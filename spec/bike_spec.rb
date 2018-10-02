require 'bike.rb'

describe Bike do
  it 'successfully creates a new Bike instance' do
    expect(Bike.new).to be_an_instance_of(Bike)
  end
  it { is_expected.to respond_to(:working?) }
end
