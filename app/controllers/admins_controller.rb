class AdminsController < ApplicationController
    # load_and_authorize_resource

    def index
        @user = User.new
    end

    def create
    end
end