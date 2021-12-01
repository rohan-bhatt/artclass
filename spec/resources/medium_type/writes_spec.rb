require "rails_helper"

RSpec.describe MediumTypeResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "medium_types",
          attributes: {},
        },
      }
    end

    let(:instance) do
      MediumTypeResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { MediumType.count }.by(1)
    end
  end

  describe "updating" do
    let!(:medium_type) { create(:medium_type) }

    let(:payload) do
      {
        data: {
          id: medium_type.id.to_s,
          type: "medium_types",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      MediumTypeResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { medium_type.reload.updated_at }
      # .and change { medium_type.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:medium_type) { create(:medium_type) }

    let(:instance) do
      MediumTypeResource.find(id: medium_type.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { MediumType.count }.by(-1)
    end
  end
end
