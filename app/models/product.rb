class Product < ApplicationRecord
  belongs_to :product_type
  belongs_to :color
  belongs_to :cut
end
