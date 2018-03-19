class Restaurant < ApplicationRecord
  enum type: [ :cod, :kainai ]
	has_many :addresses, as: :addressable
	has_and_belongs_to_many :categories
end
