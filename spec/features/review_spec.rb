
feature "adding a review" do

  scenario "adding a review" do
      visit "/reviews/new"
      fill_in 'Rating', with: 5
      fill_in 'Comment', with: 'Good'
      click_button'Save Review'
      expect(page).to have_content 'Good'

  end



end
