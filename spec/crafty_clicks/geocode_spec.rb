require 'spec_helper'

RSpec.describe CraftyClicks::Geocode, :vcr do
  subject { CraftyClicks::Geocode.new(postcodes: ['AA11AA', 'AA11AB']) }

  describe '#geocode' do
    it 'returns some results' do
      expect(subject.geocode).to_not be_empty
    end
  end
end
