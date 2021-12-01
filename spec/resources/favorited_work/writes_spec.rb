require 'rails_helper'

RSpec.describe FavoritedWorkResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'favorited_works',
          attributes: { }
        }
      }
    end

    let(:instance) do
      FavoritedWorkResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { FavoritedWork.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:favorited_work) { create(:favorited_work) }

    let(:payload) do
      {
        data: {
          id: favorited_work.id.to_s,
          type: 'favorited_works',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      FavoritedWorkResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { favorited_work.reload.updated_at }
      # .and change { favorited_work.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:favorited_work) { create(:favorited_work) }

    let(:instance) do
      FavoritedWorkResource.find(id: favorited_work.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { FavoritedWork.count }.by(-1)
    end
  end
end