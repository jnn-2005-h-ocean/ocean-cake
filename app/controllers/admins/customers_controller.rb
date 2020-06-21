class Admins::CustomersController < ApplicationController

  before_action :authenticate_admin!
  
  def index
    if params[:search].nil?
      @customers = Customer.all.page(params[:page])
    elsif params[:search].blank?
      @customers = Customer.all.page(params[:page])
    else
      @customers = Customer.where("last_name like?", "%#{params[:search]}%" ).page(params[:page])
    end
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
  	@customer = Customer.find(params[:id])
  end

  def update
  	@customer = Customer.find(params[:id])
  	if @customer.update(customer_params)
  	  redirect_to admins_customer_path(@customer.id)
    else
      render action: :edit
    end
  end

  private
  def customer_params
      params.require(:customer).permit(:last_name, :first_name, :kana_last_name, :kana_first_name, :email, :phone_number, :postal_code, :address, :is_active)
  end

  def full_name

  end

end