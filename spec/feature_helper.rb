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

  def add_review
    visit "/restaurants/1"
    click_link("Add review")
    fill_in :review_comment, with: 'really good'
    select '5', from: 'review_rating'
    click_button'Leave Review'
  end

end
