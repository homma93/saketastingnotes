class ApplicationController < ActionController::Base
  
  include SessionsHelper
  
  private

  def require_account_logged_in
    unless logged_in?
      redirect_to root_url
    end
  end
end
