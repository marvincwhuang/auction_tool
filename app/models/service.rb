class Service < ApplicationRecord
  validates :name, presence: true
  has_many :prices, :dependent => :destroy
  belongs_to :brand
  has_many :products_services
  has_many :products, :through => :products_services
end
