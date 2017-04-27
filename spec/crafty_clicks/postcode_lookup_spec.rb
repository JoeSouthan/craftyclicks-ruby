require 'spec_helper'

RSpec.describe CraftyClicks::PostcodeLookup, :vcr do
  subject { CraftyClicks::PostcodeLookup.new(postcode: 'AA11AA') }

  describe '#full_address' do
    it 'returns results' do
      expect(subject.full_address['thoroughfares']).to_not be_empty
    end
  end

  describe '#basic_address' do
    it 'returns results' do
      expect(subject.basic_address['thoroughfares']).to_not be_empty
    end
  end
end
