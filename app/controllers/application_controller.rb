class ApplicationController < ActionController::Base
  protect_from_forgery

  def index


    render :index
  end

  def fight
    @username1 = params[:user1]
    @username2 = params[:user2]

    render :fight
  end

end
