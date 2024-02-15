class Apartment < ApplicationRecord
  belongs_to :user
  validates :street, :user_id, presence: true
end
