module FeatureHelper
  def add_restaurant
    visit '/'
    click_link 'Add restaurant'
    fill_in :restaurant_name, with: 'Hungry Donkey'
    fill_in :restaurant_description, with: 'The best greek restaurant in town'
    click_button 'Submit'
  end

  def click_add_restaurant
    visit '/'
    click_link 'Add restaurant'
  end
end
