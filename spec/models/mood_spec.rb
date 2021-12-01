require 'rails_helper'

RSpec.describe Mood, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:artworks) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end
