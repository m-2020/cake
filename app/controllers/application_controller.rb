class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

	def after_sign_in_path_for(resource)
		if admin_signed_in?

	 	  admins_orders_top_path

			elsif customer_signed_in?

			products_path
			end

		end
	def after_sign_out_path_for(resource)
	  root_path
	end
	  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :email, :first_name, :last_name_kana, :first_name_kana, :post_code, :address, :phone_number])

  end
end




