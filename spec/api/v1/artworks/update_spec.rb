require "rails_helper"

RSpec.describe "artworks#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/artworks/#{artwork.id}", payload
  end

  describe "basic update" do
    let!(:artwork) { create(:artwork) }

    let(:payload) do
      {
        data: {
          id: artwork.id.to_s,
          type: "artworks",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(ArtworkResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { artwork.reload.attributes }
    end
  end
end
