require 'rails_helper'

RSpec.describe MediumTypeResource, type: :resource do
  describe 'serialization' do
    let!(:medium_type) { create(:medium_type) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(medium_type.id)
      expect(data.jsonapi_type).to eq('medium_types')
    end
  end

  describe 'filtering' do
    let!(:medium_type1) { create(:medium_type) }
    let!(:medium_type2) { create(:medium_type) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: medium_type2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([medium_type2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:medium_type1) { create(:medium_type) }
      let!(:medium_type2) { create(:medium_type) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            medium_type1.id,
            medium_type2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            medium_type2.id,
            medium_type1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
