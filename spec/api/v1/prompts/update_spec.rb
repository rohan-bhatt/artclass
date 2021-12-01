require "rails_helper"

RSpec.describe "prompts#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/prompts/#{prompt.id}", payload
  end

  describe "basic update" do
    let!(:prompt) { create(:prompt) }

    let(:payload) do
      {
        data: {
          id: prompt.id.to_s,
          type: "prompts",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(PromptResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { prompt.reload.attributes }
    end
  end
end
