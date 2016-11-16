require 'rails_helper'

RSpec.describe Review, type: :model do

  	subject(:review) {described_class.new(rating: "3", comment: "DONT ORDER HERE. Eat cereal you already have. See that canned soup in the pantry? Cook it. F$!@ this place! Never again!")}

  	it "should set the rating" do
  		expect(review.rating).to eq(3)
  	end

  	it "should set the comment" do
  		expect(review.comment).to eq("DONT ORDER HERE. Eat cereal you already have. See that canned soup in the pantry? Cook it. F$!@ this place! Never again!")
  	end

    it "needs a rating" do
      review2 = Review.new(rating: "")
      expect {review2.save}.to_not change{Review.count}
    end

    it "should have a rating greater than or equal to 1" do
      review2 = Review.new(rating: "0")
      p review2
      expect {review2.save}.to_not change{Review.count}
    end

    it "should have a rating less than or equal to 5" do
      review2 = Review.new(rating: "6")
      expect {review2.save}.to_not change{Review.count}
    end
  end
