require "rails_helper"

RSpec.describe "favorited_works#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/favorited_works", payload
  end

  describe "basic create" do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: "favorited_works",
          attributes: params,
        },
      }
    end

    it "works" do
      expect(FavoritedWorkResource).to receive(:build).and_call_original
      expect do
        make_request
        expect(response.status).to eq(201), response.body
      end.to change { FavoritedWork.count }.by(1)
    end
  end
end
