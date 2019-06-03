# frozen_string_literal: true

require 'spec_helper'

RSpec.describe CraftyClicks::AddressLookup, :vcr do
  describe '#find' do
    subject { CraftyClicks::AddressLookup.find(query: 'Buckingham Palace', country: 'GB') }

    it 'returns some results' do
      expect(subject['results']).to_not be_empty
    end
  end

  describe '#retrieve' do
    subject { CraftyClicks::AddressLookup.retrieve(id: '26086283', country: 'GB') }

    it 'returns a result' do
      expect(subject['result']).to_not be_empty
    end
  end
end
