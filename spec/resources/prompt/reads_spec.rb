require 'rails_helper'

RSpec.describe PromptResource, type: :resource do
  describe 'serialization' do
    let!(:prompt) { create(:prompt) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(prompt.id)
      expect(data.jsonapi_type).to eq('prompts')
    end
  end

  describe 'filtering' do
    let!(:prompt1) { create(:prompt) }
    let!(:prompt2) { create(:prompt) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: prompt2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([prompt2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:prompt1) { create(:prompt) }
      let!(:prompt2) { create(:prompt) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            prompt1.id,
            prompt2.id
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
            prompt2.id,
            prompt1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
