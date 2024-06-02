class ApplicationController < ActionController::Base
 before_action :authenticate_user!
 before_action :configure_permitted_parameters, if: :devise_controller?
 before_action :store_user_location!, if: :storable_location?

 private

 # Ensure the location is stored if the request is a GET, is not handled by a Devise controller, and is not an Ajax request.
def storable_location?
  request.get? && is_navigational_format? && !devise_controller? && !request.xhr?
end

def store_user_location!
  # Store the location for the user
  store_location_for(:user, request.fullpath)
end

# Override Devise method to redirect to stored location after sign-in
def after_sign_in_path_for(resource_or_scope)
  stored_location_for(resource_or_scope) || super
end

# Override Devise method to redirect to stored location after sign-up
def after_sign_up_path_for(resource_or_scope)
  stored_location_for(resource_or_scope) || super
end

 def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
  devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name])

    # For additional in app/views/devise/registrations/edit.html.erb
  devise_parameter_sanitizer.permit(:account_update, keys: [:first_name, :last_name])
 end
end
