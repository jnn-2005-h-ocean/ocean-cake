class Admins::HomesController < ApplicationController
	before_action :authenticate_admin!
	layout 'admins'

	def top
		range = Date.today.beginning_of_day..Date.today.end_of_day
		@range = OrderItem.where(created_at: range)
	end

end
