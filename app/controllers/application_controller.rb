class ApplicationController < ActionController::Base
	include Pundit
	protect_from_forgery
	rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
	before_action :configure_permitted_parameters, if: :devise_controller?

	private

	def user_not_authorized
		flash[:notice] = 'Anda tidak berwenang untuk melakukan tindakan ini.'
		redirect_to root_path
	end

	def configure_permitted_parameters
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
	end
end
