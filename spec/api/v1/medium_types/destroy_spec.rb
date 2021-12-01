require "rails_helper"

RSpec.describe "medium_types#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/medium_types/#{medium_type.id}"
  end

  describe "basic destroy" do
    let!(:medium_type) { create(:medium_type) }

    it "updates the resource" do
      expect(MediumTypeResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { MediumType.count }.by(-1)
      expect { medium_type.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
