require 'rails_helper'

RSpec.describe "medium_types#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/medium_types", params: params
  end

  describe 'basic fetch' do
    let!(:medium_type1) { create(:medium_type) }
    let!(:medium_type2) { create(:medium_type) }

    it 'works' do
      expect(MediumTypeResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['medium_types'])
      expect(d.map(&:id)).to match_array([medium_type1.id, medium_type2.id])
    end
  end
end
