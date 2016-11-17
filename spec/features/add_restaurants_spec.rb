feature 'Add restaurant' do

  before do
    user = User.create email: 'tansaku@gmail.com', password: '12345678', password_confirmation: '12345678'
    login_as user
  end
  
  scenario 'can add a restaurant', focus: :true do
    expect{add_restaurant}.to change{Restaurant.count}.by(1)
    expect(page).to have_content 'Hungry Donkey'
    expect(page).to have_content 'The best greek restaurant in town'
    expect(page).to have_content 'Restaurant was successfully added'
  end

  scenario 'doesn\'t add restaurant with empty restaurant name' do
    click_add_restaurant
    fill_in :restaurant_name, with: ''
    fill_in :restaurant_description, with: 'The best greek restaurant in town'
    expect{click_button('Submit')}.not_to change{Restaurant.count}
    expect(page).to have_content 'Name can\'t be blank'
    expect(page).to have_current_path('/restaurants')
  end

  scenario 'doesn\'t add restaurant with empty restaurant description' do
    click_add_restaurant
    fill_in :restaurant_name, with: 'Hungry Donkey'
    fill_in :restaurant_description, with: ''
    expect{click_button('Submit')}.not_to change{Restaurant.count}
    expect(page).to have_content 'Description can\'t be blank'
    expect(page).to have_current_path('/restaurants')
  end

  scenario 'doesn\'t add restaurant name with more than 50 chars' do
    click_add_restaurant
    fill_in :restaurant_name, with: 'e19YtJw7QWWpqjQ9SC9wuaNbWMWj8aV1aytjzyVNWA9KLeWhPHh'
    fill_in :restaurant_description, with: 'The best greek restaurant in town'
    expect{click_button('Submit')}.not_to change{Restaurant.count}
    expect(page).to have_content 'Name is too long (maximum is 50 characters)'
    expect(page).to have_current_path('/restaurants')
  end

  scenario 'doesn\'t add description name with more than 1500 chars' do
    click_add_restaurant
    fill_in :restaurant_name, with: 'Hungry Donkey'
    fill_in :restaurant_description, with: 'swN6xDtcrvHS5Gwn2lwO6W4rPtN3qhwHvvk1gBOKxbaD0ZvF4oLC42YhTLGIO0WEK9tKzc4R9DfjNKtrZjQ58wIuztFUyU8ftt66kjj2OHDixkHfAfHO4NGrhjXHnwbZsAKFYtRfA4anpPs0RFJhPCjD7oRHWFr6z3Agnv34Auf5a7VLkWkmYuSv9uqWaWGJnAm8lgflE5MfVTh3OVDg9vrrtcNRRUZ68xrYz8fY2GqCy178magoJ8BKZzPoW83SWI671Fi04vBgKH33E10AJzn2W9bbtz56EVrqHRcNejjnLcaCU2EK4600Uv93DeIhOk9hIBKHGc1hGXuDSg5RGeckrz2p1N2CTk2eNJAYFUj8C6M5DO0JosDKufpnRBTjTsNGjk0JQxOISwNyOz4BCncUtvGC5xzzHTM6mKWMm0JZQU8Pg5sAUVQRpU1XLKlgDB4W0e0vGlCHDnDAU6HnVCOpVSch1ktPQmUwgIHo33ucUZ5inIQyuUbyVLsaK5FRDUsiYp30U7Zg4qTGO2TBOwNHNB0aUWi5P0xPfP4hh6JvXDbwR3Ho8va39A7MuDW8hm3Z0xBqXWISyyG4caemn5vYBEaIieof2Q1vKuAOm4rh8JBuaCjAEwUH0Z4u2hcYTWisinW6ObmEZS9RhBzO9oSLblE3pPJ7CNeGqXw5klcf5kPsG3HUxmiLISwnbL944eqWI9J8jcEPHz3meC8a5FQXHaIBTWskoF3MkPzSacKmehZfGEWNfEbW5R3urrSH63T15mAMayXTy5bfTpiAu1Uk4Y9feqRLjbco1FRuHhTM7e04KDiMsFjbpsRZbx6ZEl10kOyusyAAKxzVWZiax50oLWODtIcyEZjRsj6ncDrJxiqZmiCcG2BGhLgn6z4Vt27KIqbDhVsKmgHQ8XJ7MDIFKvVeg2lcgr4TbsJS2gQa62F6kyrc6FKyM7DANmhjXTCtYLLBqYi4YTlaJIvQAw3o7pmz2UQfIgm1M3en2QUwWrayqlENGX6SFpNcyAmrKfjBfev0MrR1yg7qRUo05J11MBh7E7ljri8nEgMMzDKgY36hDkwo0EwrUOGZIAAyT0gV1sJxyjbXkSkDgChfm1140eAqkmMpHAhMsbXMES91Hg3CLGECfkgq1e8vvL3QR4LUnUjZzFelL1Gv6Cyj30DDm1s5zsNNySZw3Mg9rPb0b0X7OOCj7IuShB6zAFGG5UxXLiJijoyuUWW5zM100CR7sHSNQFNGJzIeGoZm4epxUW9DzpINPCzpyuLFDeXHNFmurE8i3bzqcplRopXuHJMprtc9HkYYJh9SHvK0PZyRGLkAF6bxaoSSXExpAfsGIkj14vpbznnTqDuhNLsnq1iWNb8gL8t5WRHWC7nWkKCRBBjYvIpHgbGRbYabnsm1i2K4FicWVDcPb35W4NO8o5tWqwVHLFYf9p7C021N6i2c6c7xfeyWXNXo7FhhZLDG5ucjvb7xGeGXa008GH7uT5fitIhWX'
    expect{click_button('Submit')}.not_to change{Restaurant.count}
    expect(page).to have_content 'Description is too long (maximum is 1500 characters)'
    expect(page).to have_current_path('/restaurants')
  end

  scenario "need to be signed in to add a restaurant" do
    visit '/'
    click_link "Sign Out"
    expect(page).to_not have_content "Add restaurant"
  end
end
