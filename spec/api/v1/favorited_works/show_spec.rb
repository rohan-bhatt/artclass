require 'rails_helper'

RSpec.describe "favorited_works#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/favorited_works/#{favorited_work.id}", params: params
  end

  describe 'basic fetch' do
    let!(:favorited_work) { create(:favorited_work) }

    it 'works' do
      expect(FavoritedWorkResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('favorited_works')
      expect(d.id).to eq(favorited_work.id)
    end
  end
end
