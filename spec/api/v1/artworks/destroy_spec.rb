require 'rails_helper'

RSpec.describe "artworks#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/artworks/#{artwork.id}"
  end

  describe 'basic destroy' do
    let!(:artwork) { create(:artwork) }

    it 'updates the resource' do
      expect(ArtworkResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Artwork.count }.by(-1)
      expect { artwork.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
