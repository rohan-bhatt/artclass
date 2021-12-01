require 'rails_helper'

RSpec.describe Prompt, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:artworks) }

    it { should belong_to(:prompter) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    it { should validate_presence_of(:body) }

    it { should validate_presence_of(:title) }

    end
end
