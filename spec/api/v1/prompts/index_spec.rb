require "rails_helper"

RSpec.describe "prompts#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/prompts", params: params
  end

  describe "basic fetch" do
    let!(:prompt1) { create(:prompt) }
    let!(:prompt2) { create(:prompt) }

    it "works" do
      expect(PromptResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["prompts"])
      expect(d.map(&:id)).to match_array([prompt1.id, prompt2.id])
    end
  end
end
