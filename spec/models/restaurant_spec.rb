require 'rails_helper'

RSpec.describe Restaurant, type: :model do

	subject(:restaurant) {described_class.create(name: "Tayyabs", description: "Great Indian Restaurant")}

  it 'should calculate average rating' do
		restaurant.reviews.create(rating: 5, comment: "Great Indian Restaurant")
		restaurant.reviews.create(rating: 1, comment: "Awful")
		restaurant.reviews.create(rating: 2, comment: "Passable")
		expect(restaurant.average_rating).to eq(3)
  end

	it "should set the name" do
		expect(restaurant.name).to eq("Tayyabs")
	end

	it "should set the description" do
		expect(restaurant.description).to eq("Great Indian Restaurant")
	end

end
