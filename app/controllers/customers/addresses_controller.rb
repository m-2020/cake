class Customers::AddressesController < ApplicationController

    # before_action :authenticate_customer!

	def index
		@address = Address.new
		@addresses = Address.all
	end

	def new
		@address = Address.new
	end

	def create
		@address = Address.new(address_params)
		@address.save
		redirect_to addresses_path
	end


	def edit
		@address = Address.find(params[:id])
        # if @address.customer.id != current_customer.id
        # 	redirect_to addresses_path
        # end
	end

	def update
		address = Address.find(params[:id])
        address.update(address_params)
        redirect_to addresses_path
	end

	def destroy
		address = Address.find(params[:id])
		address.destroy
		redirect_to addresses_path
	end

	private

	def address_params
		params.require(:address).permit(:post_code, :address, :name)
	end
end
