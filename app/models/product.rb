class Product < ActiveRecord::Base
  has_and_belongs_to_many :categories
	has_and_belongs_to_many :sections	
	has_and_belongs_to_many :questions
end
