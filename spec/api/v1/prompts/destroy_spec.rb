require 'rails_helper'

RSpec.describe "prompts#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/prompts/#{prompt.id}"
  end

  describe 'basic destroy' do
    let!(:prompt) { create(:prompt) }

    it 'updates the resource' do
      expect(PromptResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Prompt.count }.by(-1)
      expect { prompt.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
