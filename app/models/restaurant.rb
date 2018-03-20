class Restaurant < ApplicationRecord
  has_and_belongs_to_many :categories
	has_many :addresses, as: :addressable
end
