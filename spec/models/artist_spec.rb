require "rails_helper"

RSpec.describe Artist, type: :model do
  describe "Direct Associations" do
    it { should have_many(:favorited_works) }

    it { should have_many(:created_works) }

    it { should have_many(:prompts) }

    it { should have_many(:artworks) }
  end

  describe "InDirect Associations" do
    it { should have_many(:favorites) }
  end

  describe "Validations" do
    it { should validate_presence_of(:username) }
  end
end
