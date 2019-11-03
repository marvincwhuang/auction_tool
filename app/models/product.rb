class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :brand
  has_many :prices, :dependent => :delete_all
end
