require 'rails_helper'

RSpec.describe Restaurant, type: :model do

  let(:user) { User.create email: 'tansaku@gmail.com', password: '12345678', password_confirmation: '12345678' }

	subject(:restaurant) {described_class.create(name: "Tayyabs", description: "Great Indian Restaurant",
		user_id: user.id)}

  it 'should calculate average rating' do
		restaurant.reviews.create(rating: 5, comment: "Great Indian Restaurant", user_id: user.id)
		restaurant.reviews.create(rating: 1, comment: "Awful", user_id: user.id)
		restaurant.reviews.create(rating: 2, comment: "Passable", user_id: user.id)
		expect(restaurant.average_rating).to eq(3)
  end

	it 'should deliver appropriate message if no reviews' do
			expect(restaurant.average_rating).to eq("No ratings yet")
	end

	it "should set the name" do
		expect(restaurant.name).to eq("Tayyabs")
	end

	it "should set the description" do
		expect(restaurant.description).to eq("Great Indian Restaurant")
	end

	it "should have a user", focus: :true do
    expect(restaurant.user).to eq user
  end

  it "should delete reviews with restaurant" do
    review = restaurant.reviews.create(rating: 1, comment: "Awful", user_id: user.id)

    expect{restaurant.destroy}.to change{Review.count}.by(-1)

  end

end
