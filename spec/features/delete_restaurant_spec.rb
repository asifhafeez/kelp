feature 'Delete restaurant' do

  before do
    user = User.create email: 'tansaku@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as user
  end
  scenario 'can delete a restaurant' do
    add_restaurant
    click_link 'More info'
    click_link 'Edit details'
    expect{click_link 'Delete'}.to change{Restaurant.count}.by(-1)
  end
end
