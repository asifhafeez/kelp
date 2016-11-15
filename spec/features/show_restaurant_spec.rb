feature 'Show restaurant' do
  scenario 'when user visits the restaurant page' do
    add_restaurant
    click_link 'More info'
    expect(page).to have_content 'Hungry Donkey'
    expect(page).to have_content 'The best greek restaurant in town'
    expect(page).to have_link 'Edit details'
    expect(page).to have_link 'Add review'
  end
end
