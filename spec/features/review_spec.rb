feature "adding a review" do
    before do
      user = User.create email: 'tansaku@gmail.com', password: '12345678', password_confirmation: '12345678'
      login_as user
      add_restaurant
      logout
      user_2 = User.create email: 'bilbobaggins@gmail.com', password: 'theshire', password_confirmation: 'theshire'
      login_as user_2
    end

  scenario "adding and seeing reviews" do
    add_review
    expect(page).to have_content("really good")
    expect(page).to have_content("Rating: 5")
    expect(page).to have_content("Average Rating: 5")
    expect(page).to have_content("bilbobaggins@gmail.com")
  end

  scenario "adding a second review on the same restaurant" do
    add_review
    expect{add_review}.not_to change{Review.count}
  end
end
