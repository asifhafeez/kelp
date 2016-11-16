class Review < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :user
  validates :rating, presence: true, inclusion: 1..5
  validates :comment, length: { maximum: 1500 }
end
