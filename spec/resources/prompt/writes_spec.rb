require 'rails_helper'

RSpec.describe PromptResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'prompts',
          attributes: { }
        }
      }
    end

    let(:instance) do
      PromptResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Prompt.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:prompt) { create(:prompt) }

    let(:payload) do
      {
        data: {
          id: prompt.id.to_s,
          type: 'prompts',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      PromptResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { prompt.reload.updated_at }
      # .and change { prompt.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:prompt) { create(:prompt) }

    let(:instance) do
      PromptResource.find(id: prompt.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Prompt.count }.by(-1)
    end
  end
end
