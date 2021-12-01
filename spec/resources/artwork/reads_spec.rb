require "rails_helper"

RSpec.describe ArtworkResource, type: :resource do
  describe "serialization" do
    let!(:artwork) { create(:artwork) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(artwork.id)
      expect(data.jsonapi_type).to eq("artworks")
    end
  end

  describe "filtering" do
    let!(:artwork1) { create(:artwork) }
    let!(:artwork2) { create(:artwork) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: artwork2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([artwork2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:artwork1) { create(:artwork) }
      let!(:artwork2) { create(:artwork) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      artwork1.id,
                                      artwork2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      artwork2.id,
                                      artwork1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
