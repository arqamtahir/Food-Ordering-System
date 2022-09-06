class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # Authenticate_invitor method
    protected

    def authenticate_inviter!
      authenticate_admin_user!(force: true)
    end

end
