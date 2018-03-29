class Favourite < ApplicationRecord
  belongs_to :favouriteable, polymorphic: true
end
