require 'rails_helper'

RSpec.describe Artist, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:artworks) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:username) }

    end
end
