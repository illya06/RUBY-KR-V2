class ApplicationController < ActionController::Base
    include Pundit

    rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

    private
    def user_not_authorized
        flash[:alert] = "You aint authorized man"
        redirect_to(request.referrer || root_path)
    end
end
