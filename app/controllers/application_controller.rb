class ApplicationController < ActionController::Base
  protect_from_forgery

  def index

    render :index
  end

  def fight

    render :fight
  end

end
