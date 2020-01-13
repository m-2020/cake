class Customers::CustomersController < ApplicationController

def show
	@customer = current_customer


end

def edit
	@customer = current_customer

end

def update

end

def change
	current_customer.update(entry_status: false)
	redirect_to root_path

end

def withdraw

end




end
