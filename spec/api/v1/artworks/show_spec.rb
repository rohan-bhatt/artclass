require "rails_helper"

RSpec.describe "artworks#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/artworks/#{artwork.id}", params: params
  end

  describe "basic fetch" do
    let!(:artwork) { create(:artwork) }

    it "works" do
      expect(ArtworkResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("artworks")
      expect(d.id).to eq(artwork.id)
    end
  end
end
