class Review < ActiveRecord::Base

  belongs_to :restaurant
  belongs_to :user
  validates :restaurant, presence: true
  validates :user, presence: true, uniqueness: true
  validates :rating, presence: true, inclusion: 1..5
  validates :comment, length: { maximum: 1500 }

  def get_user_email
    user = User.find(user_id)
    user.email
  end

end
