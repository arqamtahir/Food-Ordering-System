class ApplicationController < ActionController::Base
    # Authenticate_invitor method
    protected

    def authenticate_inviter!
      authenticate_admin_user!(force: true)
    end

    def after_invite_path_for(resource)
      admin_employees_path
    end
end
