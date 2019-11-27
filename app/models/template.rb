class Template < ApplicationRecord
  validates :template_name, uniqueness: true
end
