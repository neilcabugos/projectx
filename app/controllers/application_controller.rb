class ApplicationController < ActionController::Base
    before_action :authenticate_user!
    protect_from_forgery prepend: true

    def index
        render json: "Server is up and running" 
    end

    rescue_from CanCan::AccessDenied do
        flash[:error] = 'Access denied!'
        redirect_to :back
    end

    protected

    def after_sign_in_path_for(resource)
        puts resource
      case current_user.role
        when 'super_admin'
            rails_admin_path
        when 'admin'
            admin_path
        else
            member_path
      end
    end
end
