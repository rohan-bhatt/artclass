require "rails_helper"

RSpec.describe "moods#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/moods", params: params
  end

  describe "basic fetch" do
    let!(:mood1) { create(:mood) }
    let!(:mood2) { create(:mood) }

    it "works" do
      expect(MoodResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["moods"])
      expect(d.map(&:id)).to match_array([mood1.id, mood2.id])
    end
  end
end
