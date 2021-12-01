require "rails_helper"

RSpec.describe "favorited_works#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/favorited_works/#{favorited_work.id}"
  end

  describe "basic destroy" do
    let!(:favorited_work) { create(:favorited_work) }

    it "updates the resource" do
      expect(FavoritedWorkResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { FavoritedWork.count }.by(-1)
      expect { favorited_work.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
