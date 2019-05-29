module SessionsHelper
  def current_account
    @current_account ||= Account.find_by(id: session[:user_id])
  end

  def logged_in?
    !!current_account
  end
end