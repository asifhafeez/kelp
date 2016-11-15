feature 'Add restaurant' do
  scenario 'can add a restaurant' do
    expect{add_restaurant}.to change{Restaurant.count}.by(1)
    expect(page).to have_content 'Hungry Donkey'
    expect(page).to have_content 'The best greek restaurant in town'
    expect(page).to have_content 'Restaurant was successfully added'
  end
end
