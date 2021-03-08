class RegistrationsController < Devise::RegistrationsController

  protected
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :profile_photo, :profile_photo_cache, :remove_profile_photo])
  end
  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
  def after_update_path_for(resource)
    user_path(resource)
  end
end