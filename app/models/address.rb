class Address < ApplicationRecord

	belongs_to :customer

    validates :shipping_postal_code, presence: true, length: { is: 7 }, numericality: { only_integer: true }
	validates :shipping_address, presence: true
	validates :shipping_name, presence: true

  def full_address
    shipping_name + " 様" + "  〒" + shipping_postal_code + "  " + shipping_address
  end

end
