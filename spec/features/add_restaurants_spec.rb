feature 'Add restaurant' do
  scenario 'can add a restaurant' do
    visit '/'
    click_link 'Add restaurant'
    fill_in :restaurant_name, with: 'Hungry Donkey'
    fill_in :restaurant_description, with: 'The best greek restaurant in town'
    expect{click_button 'Submit'}.to change{Restaurant.count}.by(1)
    expect(page).to have_content 'Hungry Donkey'
    expect(page).to have_content 'The best greek restaurant in town'
    expect(page).to have_content 'Restaurant was successfully added'
  end
end
