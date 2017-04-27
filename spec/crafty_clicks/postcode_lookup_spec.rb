require 'spec_helper'

RSpec.describe CraftyClicks::PostcodeLookup, :vcr do
  describe '#full_address' do
    subject { CraftyClicks::PostcodeLookup.full_address(postcode: 'AA11AA') }

    it 'returns results' do
      expect(subject['thoroughfares']).to_not be_empty
    end
  end

  describe '#basic_address' do
    subject { CraftyClicks::PostcodeLookup.basic_address(postcode: 'AA11AA') }

    it 'returns results' do
      expect(subject['thoroughfares']).to_not be_empty
    end
  end
end
