require "rails_helper"

RSpec.describe "moods#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/moods/#{mood.id}", payload
  end

  describe "basic update" do
    let!(:mood) { create(:mood) }

    let(:payload) do
      {
        data: {
          id: mood.id.to_s,
          type: "moods",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(MoodResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { mood.reload.attributes }
    end
  end
end
