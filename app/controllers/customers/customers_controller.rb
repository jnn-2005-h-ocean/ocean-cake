class Customers::CustomersController < ApplicationController

  before_action :authenticate_customer!
  before_action :active_customer?
  before_action :correct_customer?

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customer_path(@customer)
    else
      render :edit
    end
  end

  def delete

  end

  def destroy
    @customer = Customer.find(params[:id])
    @customer.update(is_active: false)
    sign_out(current_customer)
    redirect_to root_path
  end

  private
  def customer_params
    params.require(:customer).permit(
      :last_name,
      :first_name,
      :kana_last_name,
      :kana_first_name,
      :email, :postal_code,
      :address,
      :phone_number, 
      :is_active
    )
  end
end