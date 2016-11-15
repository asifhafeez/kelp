feature 'Edit restaurant' do
  scenario 'can edit a restaurant' do
    visit '/'
    click_link 'Add restaurant'
    fill_in :restaurant_name, with: 'Hungry Donkey'
    fill_in :restaurant_description, with: 'The best greek restaurant in town'
    click_button 'Submit'
    click_link 'More info'
    click_link "Edit details"
    fill_in :restaurant_name, with: "Hungrier Donkey"
    fill_in :restaurant_description, with: "The best of the best greek restaurant in town"
    click_button "Submit"
    expect(page).to have_content "Hungrier Donkey"
    expect(page).to have_content "The best of the best greek restaurant in town"
    expect(page).to have_content 'Restaurant was successfully updated'
  end
end
