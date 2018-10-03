require 'bike.rb'

describe Bike do
  it 'successfully creates a new Bike instance' do
    expect(Bike.new).to be_an_instance_of(Bike)
  end

  it { is_expected.to respond_to(:working?) }

  it 'expects a new bike to be working' do
    expect(Bike.new.working?).to eq(true)
  end

  it 'allows a bike to be reported as broken' do
    expect(Bike.new.report_as_broken).to eq "Thank you for reporting a broken bike."
  end
end
