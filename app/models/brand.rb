class Brand < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :products, :dependent => :delete_all
end
