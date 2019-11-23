class Product < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  belongs_to :brand
  has_many :prices, :dependent => :delete_all
  has_one :yahoo_template, :dependent => :delete
  has_many :templates, :dependent => :delete_all
end

