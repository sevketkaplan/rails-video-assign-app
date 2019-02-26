class ApplicationController < ActionController::Base
	def after_sign_in_path_for(resource)
		
		user_path(current_user.to_param)
 	#giriş yaptıktan sonra yönlendirilecek sayfanın route kısmı buraya yazılacak		
	end
	def after_sign_out_path_for(resource)
		root_path

	end
	
	before_action :configure_permitted_parameters, if: :devise_controller?

	protected

	def configure_permitted_parameters
		added_attrs = [:name_surname, :email, :password, :password_confirmation, :remember_me]
		devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
		devise_parameter_sanitizer.permit :account_update, keys: added_attrs

	end
end
