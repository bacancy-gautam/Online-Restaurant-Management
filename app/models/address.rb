# this model will create instance of All Addresses
class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true
end
