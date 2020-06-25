class Order < ApplicationRecord

	has_many :order_items
	belongs_to :customer

	enum order_status:{
    入金待ち: 0, #入金待ち
    入金確認: 1, #入金確認
    制作中: 2, #制作中
    発送準備中: 3, #発送準備中
    発送済み: 4, #発送済み
  }

  enum payment_method:{
    bank_transfer: 0, #銀行振込
    credit: 1, #クレジット払い
  }

end
