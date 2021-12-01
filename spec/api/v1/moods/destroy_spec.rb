require "rails_helper"

RSpec.describe "moods#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/moods/#{mood.id}"
  end

  describe "basic destroy" do
    let!(:mood) { create(:mood) }

    it "updates the resource" do
      expect(MoodResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Mood.count }.by(-1)
      expect { mood.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
