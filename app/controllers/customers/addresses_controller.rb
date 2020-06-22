class Customers::AddressesController < ApplicationController
  layout 'customers'
  def index
    @address = Address.new
    @addresses = current_customer.addresses
  end

  def edit
    @address = Address.find(params[:id])
  end


  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
      if @address.save
        redirect_to request.referer
      else
        @addresses = current_customer.addresses
        @customer = current_customer
       render 'index'
     end
  end

  def update
   @address = Address.find(params[:id])
   @address.customer_id = current_customer.id
    if @address.update(address_params)
      redirect_to customers_customer_addresses_path(current_customer.id)
    else
       @address = Address.find(params[:id])
       render 'edit'
    end
  end

  def destroy
    @address = Address.find(params[:id])
    @address.destroy
    redirect_to request.referer
  end


  private
  def address_params
      params.require(:address).permit(:addresses_id,:shipping_postal_code, :shipping_address, :shipping_name)
  end

end
