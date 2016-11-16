feature 'Add restaurant' do
  scenario 'can add a restaurant' do
    expect{add_restaurant}.to change{Restaurant.count}.by(1)
    expect(page).to have_content 'Hungry Donkey'
    expect(page).to have_content 'The best greek restaurant in town'
    expect(page).to have_content 'Restaurant was successfully added'
  end

  scenario 'doesn\'t add empty restaurant name' do
    visit '/'
    click_link 'Add restaurant'
    fill_in :restaurant_name, with: ''
    fill_in :restaurant_description, with: 'The best greek restaurant in town'
    expect{click_button('Submit')}.not_to change{Restaurant.count}
    expect(page).to have_content 'Name can\'t be blank'
    expect(page).to have_current_path('/restaurants')
  end
end
