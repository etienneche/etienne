class UserProductType < ApplicationRecord
  belongs_to :product_type
  belongs_to :user
end
