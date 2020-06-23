class Customers::CustomersController < ApplicationController
  layout 'customers'
  before_action :authenticate_customer!
  # before_action :active_customer?
  # before_action :correct_customer?

  def show
  	@customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end


  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      redirect_to customers_customer_path(current_customer.id)
    else
      render :edit
    end
  end

  def delete
    @customer = Customer.find(params[:id])
  end

  def active
    @customer = Customer.find(params[:id])
    @customer.is_withdrawal = true
    @customer.save
    #ログアウトさせる
    reset_session
    redirect_to customers_root_path
  end

  private
  def customer_params
    params.require(:customer).permit(
      :family_name,
      :first_name,
      :family_name_kana,
      :first_name_kana,
      :email,
      :postal_code,
      :address,
      :telephone_number,
      :is_withdrawal
    )
  end
end