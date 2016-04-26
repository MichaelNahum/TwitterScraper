class Account < ActiveRecord::Base
  has_many :tweets
end
