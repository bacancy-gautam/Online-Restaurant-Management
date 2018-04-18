# this model will create instance of All Addresses
class Address < ApplicationRecord
  belongs_to :addressable, polymorphic: true, optional: true
  geocoded_by :full_address
  after_validation :geocode, if: :address_changed?
  def display_address
    "
     Home Address: #{self.addressline}
     Area: #{self.area}
     Pincode: #{self.pincode}
     City: #{self.city}
     State: #{self.state}"
  end

  def full_address
  	[addressline, area, pincode, city, state].compact.join(', ')
  end

  def address_changed?	
  	addressline_changed? || area_changed? || pincode_changed? || city_changed? || state_changed?
  end

end
