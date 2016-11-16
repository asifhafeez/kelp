
feature "adding a review" do

scenario "seeing reviews" do
  add_restaurant
  visit "/restaurants/1"
  click_link("Add review")
  fill_in :review_comment, with: 'really good'
  select '5', from: 'review_rating'
  click_button'Leave Review'
  expect(page).to have_content("really good")
  expect(page).to have_content("Rating: 5")

end


end
