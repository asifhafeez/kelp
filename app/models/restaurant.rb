class Restaurant < ActiveRecord::Base

  has_many :reviews

  def average_rating
    unless self.reviews
      self.reviews.average(:rating).round
    else
      "No ratings yet"
    end
  end

end
