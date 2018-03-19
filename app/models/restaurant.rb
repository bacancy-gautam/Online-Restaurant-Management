class Restaurant < ApplicationRecord
  has_and_belongs_to_many :categories
  enum type: [ :cod, :kainai ]
	has_many :addresses, as: :addressable
end
