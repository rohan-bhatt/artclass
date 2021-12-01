require 'rails_helper'

RSpec.describe "medium_types#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/medium_types/#{medium_type.id}", params: params
  end

  describe 'basic fetch' do
    let!(:medium_type) { create(:medium_type) }

    it 'works' do
      expect(MediumTypeResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('medium_types')
      expect(d.id).to eq(medium_type.id)
    end
  end
end
