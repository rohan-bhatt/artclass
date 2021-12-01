require 'rails_helper'

RSpec.describe "favorited_works#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/favorited_works", params: params
  end

  describe 'basic fetch' do
    let!(:favorited_work1) { create(:favorited_work) }
    let!(:favorited_work2) { create(:favorited_work) }

    it 'works' do
      expect(FavoritedWorkResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['favorited_works'])
      expect(d.map(&:id)).to match_array([favorited_work1.id, favorited_work2.id])
    end
  end
end
