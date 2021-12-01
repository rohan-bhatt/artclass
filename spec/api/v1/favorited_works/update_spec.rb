require "rails_helper"

RSpec.describe "favorited_works#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/favorited_works/#{favorited_work.id}", payload
  end

  describe "basic update" do
    let!(:favorited_work) { create(:favorited_work) }

    let(:payload) do
      {
        data: {
          id: favorited_work.id.to_s,
          type: "favorited_works",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(FavoritedWorkResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { favorited_work.reload.attributes }
    end
  end
end
