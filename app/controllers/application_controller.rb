class ApplicationController < ActionController::Base
    # Authenticate_invitor method
    protected

    def authenticate_inviter!
      authenticate_admin_user!(force: true)
    end

end
