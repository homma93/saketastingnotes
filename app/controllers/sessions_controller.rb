class SessionsController < ApplicationController
  def new
  end

  def create
    email = params[:session][:mail_address].downcase
    password = params[:session][:password]
    
    if login(email, password)
      redirect_to tastingnotes_path
    else
      flash.now[:danger] = 'アカウントまたはパスワードが異なります。'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'ログアウトしました。'
    redirect_to root_url
  end
  
  private

  def login(email, password)
    @account = Account.find_by(mail_address: email)
    if @account && @account.authenticate(password)
      # ログイン成功
      session[:user_id] = @account.id
      return true
    else
      # ログイン失敗
      return false
    end
  end
end
