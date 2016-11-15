feature 'Show restaurant' do
  scenario 'when user visits the restaurant page' do
    visit '/'
    click_link 'Add restaurant'
    fill_in :name, with: 'Hungry Donkey'
    fill_in :description, with: 'The best greek restaurant in town'
    click_button 'Add'
    click_link 'More info'
    expect(page).to have_content 'Hungry Donkey'
    expect(page).to have_content 'The best greek restaurant in town'
    expect(page).to have_link 'Edit details'
    expect(page).to have_link 'Add review'
  end
end
