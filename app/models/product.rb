class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :brand
  has_many :prices, :dependent => :delete_all
  has_many :templates, :dependent => :delete_all
  has_many :products_services
  has_many :services, :through => :products_services
end

