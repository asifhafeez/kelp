require 'rails_helper'

RSpec.describe Review, type: :model do

  	subject(:review) {described_class.new(rating: "3", comment: "DONT ORDER HERE. Eat cereal you already have. See that canned soup in the pantry? Cook it. F$!@ this place! Never again!")}

  	it "should set the rating" do
  		expect(review.rating).to eq(3)
  	end

  	it "should set the comment" do
  		expect(review.comment).to eq("DONT ORDER HERE. Eat cereal you already have. See that canned soup in the pantry? Cook it. F$!@ this place! Never again!")
  	end

  end
