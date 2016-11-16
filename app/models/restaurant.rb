class Restaurant < ActiveRecord::Base

  has_many :reviews

  def average_rating
    self.reviews.count == 0 ? "No ratings yet" : self.reviews.average(:rating).round
  end

end
