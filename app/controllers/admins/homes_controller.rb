class Admins::HomesController < ApplicationController
	before_action :authenticate_admin!
	layout 'admins'

	def top
		range = Date.today.beginning_of_day..Date.today.end_of_day
		@range = OrderItem.where(created_at: range)


		@range0 = OrderItem.where(created_at: range, making_status: 0)

		@range1 = OrderItem.where(created_at: range, making_status: 1)

		@range2 = OrderItem.where(created_at: range, making_status: 2)

		@range3 = OrderItem.where(created_at: range, making_status: 3)


		@orange0 = Order.where(created_at: range, order_status: 0)

		@orange1 = Order.where(created_at: range, order_status: 1)

		@orange2 = Order.where(created_at: range, order_status: 2)

		@orange3 = Order.where(created_at: range, order_status: 3)

		@orange4 = Order.where(created_at: range, order_status: 4)
	end

end
