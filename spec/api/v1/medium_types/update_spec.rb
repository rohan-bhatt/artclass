require 'rails_helper'

RSpec.describe "medium_types#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/medium_types/#{medium_type.id}", payload
  end

  describe 'basic update' do
    let!(:medium_type) { create(:medium_type) }

    let(:payload) do
      {
        data: {
          id: medium_type.id.to_s,
          type: 'medium_types',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(MediumTypeResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { medium_type.reload.attributes }
    end
  end
end
