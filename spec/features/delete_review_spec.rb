feature 'Delete review' do

  before do
    user = User.create email: 'tansaku@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as user
    add_restaurant
    logout
    visit '/'
    user_2 = User.create email: 'bilbobaggins@gmail.com', password: 'theshire', password_confirmation: 'theshire'
    login_as user_2
  end

  scenario 'user can delete their review' do
    add_review
    expect{click_link 'Delete'}.to change{Review.count}.by(-1)
    expect(page).not_to have_content "really good"
  end

  scenario 'user can\'t delete someone else\'s review' do
    add_review
    logout
    bill = User.create email: 'bill@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as bill
    visit '/restaurants/1'
    expect(page).not_to have_content "Delete"
  end

end
