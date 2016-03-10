class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :body, presence: true, length: { minimum: 10, message: "must be at least %{count} characters." }
  validates :user, presence: true 
  validates :product, presence: true
  validates :rating, numericality: { only_integer: true }

end
