class Customers::CustomersController < ApplicationController
before_action :authenticate_customer!
def show
	@customer = current_customer


end

def edit
	@customer = current_customer

end

def update
        @customer = current_customer
        if @customer.update(customer_params)
        redirect_to customers_path, notice: "(๑•̀ㅂ•́)و ｸﾞｯ!"
      else
        render :edit
        end

end


def withdraw

end


     private
 def customer_params
 	params.require(:customer).permit(:last_name,:first_name,:last_name_kana,:first_name_kana,:post_code,:address,:phone_number,:email)
 end


end
