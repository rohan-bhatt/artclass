require "rails_helper"

RSpec.describe "moods#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/moods/#{mood.id}", params: params
  end

  describe "basic fetch" do
    let!(:mood) { create(:mood) }

    it "works" do
      expect(MoodResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("moods")
      expect(d.id).to eq(mood.id)
    end
  end
end
