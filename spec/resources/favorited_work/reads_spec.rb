require "rails_helper"

RSpec.describe FavoritedWorkResource, type: :resource do
  describe "serialization" do
    let!(:favorited_work) { create(:favorited_work) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(favorited_work.id)
      expect(data.jsonapi_type).to eq("favorited_works")
    end
  end

  describe "filtering" do
    let!(:favorited_work1) { create(:favorited_work) }
    let!(:favorited_work2) { create(:favorited_work) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: favorited_work2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([favorited_work2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:favorited_work1) { create(:favorited_work) }
      let!(:favorited_work2) { create(:favorited_work) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      favorited_work1.id,
                                      favorited_work2.id,
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
                                      favorited_work2.id,
                                      favorited_work1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
