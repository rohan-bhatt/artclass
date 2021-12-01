require 'rails_helper'

RSpec.describe Artwork, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:artist) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:image) }

    end
end
