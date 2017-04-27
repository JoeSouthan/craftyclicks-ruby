require 'spec_helper'

RSpec.describe CraftyClicks::Geocode, :vcr do
  subject { CraftyClicks::Geocode.geocode(postcodes: ['AA11AA', 'AA11AB']) }

  describe '#geocode' do
    it 'returns some results' do
      expect(subject['results']).to_not be_empty
    end
  end
end
