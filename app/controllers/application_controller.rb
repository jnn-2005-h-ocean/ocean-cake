class ApplicationController < ActionController::Base

protected

	def after_sign_in_path_for(resource)
	 	case resource
	  when Admin
	    admins_root_path
	  when Customer
	    customers_root_path
	  end
	end


	def after_sign_up_path_for(resource)
		case resource
	  when Customer
	    customers_root_path
	  end
	end


	def after_sign_out_path_for(resource)
		case resource
	  when Admin
	    new_admin_session_path
	  when Customer
	    new_customer_session_path
	  end
	end


	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys:[:family_name, :first_name , :family_name_kana, :first_name_kana, :postal_code, :address,:telephone_number])
	end

end
