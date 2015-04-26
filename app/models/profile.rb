class Profile < ActiveRecord::Base
  has_many :profile_answere
  
  serialize :product_id
end
