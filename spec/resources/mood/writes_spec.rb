require "rails_helper"

RSpec.describe MoodResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "moods",
          attributes: {},
        },
      }
    end

    let(:instance) do
      MoodResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Mood.count }.by(1)
    end
  end

  describe "updating" do
    let!(:mood) { create(:mood) }

    let(:payload) do
      {
        data: {
          id: mood.id.to_s,
          type: "moods",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      MoodResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { mood.reload.updated_at }
      # .and change { mood.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:mood) { create(:mood) }

    let(:instance) do
      MoodResource.find(id: mood.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Mood.count }.by(-1)
    end
  end
end
