feature 'add restaurant image' do

  before do
    user = User.create email: 'tansaku@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as user
  end

  scenario 'user can add image' do
    click_add_restaurant
    fill_in :restaurant_name, with: 'Hungry Donkey'
    fill_in :restaurant_description, with: 'The best greek restaurant in town'
    click_button 'Submit'
    hd = Restaurant.find(1)
    File.open('/Users/malinnaleach/Desktop/fishy.jpg') do |f|
      hd.image = f
    end
    hd.save!
    expect(hd.image_url).to eq "/uploads/restaurant/image/1/fishy.jpg"
  end

end
