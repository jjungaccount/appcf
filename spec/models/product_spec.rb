require 'rails_helper'

describe Product do
  context "when the product has comments" do
    before do
      @product = Product.create!(name: "race bike")
      @user = FactoryGirl.create(:user)
      @product.comments.create!(rating: 1, user: @user, body: "terrible bike!")
      @product.comments.create!(rating: 3, user: @user, body: "good bike!")
      @product.comments.create!(rating: 5, user: @user, body: "great bike!")
    end
    it "returns the average rating of all comments" do
      expect(@product.average_rating).to eq 3
    end
  end

  context "name missing" do
    it "should not be valid" do
      expect(Product.new(description: "my test bike")).not_to be_valid
    end
  end
  
end