class Address < ApplicationRecord

	belongs_to :customer

  def full_address
    shipping_name + " 様" + "  〒" + shipping_postal_code + "  " + shipping_address
  end

end
