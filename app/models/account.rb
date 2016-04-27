class Account < ActiveRecord::Base
  strip_attributes
  validates :username, presence: true, uniqueness: true
  has_many :tweets, dependent: :destroy
end
