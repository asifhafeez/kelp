feature 'Delete restaurant' do
  scenario 'can delete a restaurant' do
    add_restaurant
    click_link 'More info'
    click_link 'Edit details'
    expect{click_link 'Delete'}.to change{Restaurant.count}.by(-1)
  end
end
