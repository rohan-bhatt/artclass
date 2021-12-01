require "rails_helper"

RSpec.describe ArtworkResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "artworks",
          attributes: {},
        },
      }
    end

    let(:instance) do
      ArtworkResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Artwork.count }.by(1)
    end
  end

  describe "updating" do
    let!(:artwork) { create(:artwork) }

    let(:payload) do
      {
        data: {
          id: artwork.id.to_s,
          type: "artworks",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      ArtworkResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { artwork.reload.updated_at }
      # .and change { artwork.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:artwork) { create(:artwork) }

    let(:instance) do
      ArtworkResource.find(id: artwork.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Artwork.count }.by(-1)
    end
  end
end
