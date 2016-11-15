require 'rails_helper'

RSpec.describe Restaurant, type: :model do

	subject(:restaurant) {described_class.new(name: "Tayyabs", description: "Great Indian Restaurant")}

	it "should set the name" do
		expect(restaurant.name).to eq("Tayyabs")
	end

	it "should set the description" do
		expect(restaurant.description).to eq("Great Indian Restaurant")
	end

end
