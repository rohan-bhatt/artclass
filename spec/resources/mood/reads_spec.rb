require "rails_helper"

RSpec.describe MoodResource, type: :resource do
  describe "serialization" do
    let!(:mood) { create(:mood) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(mood.id)
      expect(data.jsonapi_type).to eq("moods")
    end
  end

  describe "filtering" do
    let!(:mood1) { create(:mood) }
    let!(:mood2) { create(:mood) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: mood2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([mood2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:mood1) { create(:mood) }
      let!(:mood2) { create(:mood) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      mood1.id,
                                      mood2.id,
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
                                      mood2.id,
                                      mood1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
