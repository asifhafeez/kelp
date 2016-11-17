feature 'Edit restaurant' do

    before do
      @user = User.create email: 'tansaku@gmail.com', password: '12345678', password_confirmation: '12345678'
      @user1 = User.create email: 'hello@aol.com', password: '12345678', password_confirmation: '12345678'
      login_as @user
    end
  scenario 'can edit a restaurant' do
    add_restaurant
    click_link 'More info'
    click_link "Edit details"
    fill_in :restaurant_name, with: "Hungrier Donkey"
    fill_in :restaurant_description, with: "The best of the best greek restaurant in town"
    click_button "Submit"
    expect(page).to have_content "Hungrier Donkey"
    expect(page).to have_content "The best of the best greek restaurant in town"
    expect(page).to have_content 'Restaurant was successfully updated'
  end

  scenario 'cant edit a restaurant if user is not owner' do
    add_restaurant
    click_link 'Sign Out'
    login_as @user1
    click_link 'More info'
    expect(page).to_not have_content "Edit details"
  end
end
