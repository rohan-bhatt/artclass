require "rails_helper"

RSpec.describe "artworks#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/artworks", params: params
  end

  describe "basic fetch" do
    let!(:artwork1) { create(:artwork) }
    let!(:artwork2) { create(:artwork) }

    it "works" do
      expect(ArtworkResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["artworks"])
      expect(d.map(&:id)).to match_array([artwork1.id, artwork2.id])
    end
  end
end
