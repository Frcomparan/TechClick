class Product < ApplicationRecord
  belongs_to :seller, class_name:'User'
  has_many_attached :photos
end
