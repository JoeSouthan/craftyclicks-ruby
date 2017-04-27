require 'spec_helper'

RSpec.describe CraftyClicks::ApiBase, :vcr do
  describe '#perform_request' do
    context '200' do
      subject do
        CraftyClicks::ApiBase.new(
          product: :postcode,
          service: :rapidaddress,
          http_method: :post,
          params: {
            postcode: 'EC1A 9HF'
          }
        )
      end

      it 'returns a hash' do
        expect(subject.perform_request).to be_kind_of(Hash)
      end

      it "doesn't raise" do
        expect { subject.perform_request }.to_not raise_error
      end
    end

    context '404' do
      subject do
        CraftyClicks::ApiBase.new(
          product: :postcode,
          service: :missing_endpoint,
          http_method: :post,
          params: {
            postcode: 'EC1A 9HF'
          }
        )
      end

      it 'raises ApiError' do
        expect { subject.perform_request }.to raise_error(CraftyClicks::ApiBase::Exceptions::ApiError)
      end
    end

    context 'error key was detected as a key' do
      subject do
        CraftyClicks::ApiBase.new(
          product: :postcode,
          service: :rapidaddress,
          http_method: :post,
          params: {
            postcode: 'EC1A 9HF'
          }
        )
      end

      it 'raises ApiError' do
        expect { subject.perform_request }.to raise_error(CraftyClicks::ApiBase::Exceptions::ApiError)
      end
    end
  end
end
