class AccountsController < ApplicationController
  def new
    @account = Account.new
  end

  def create
    @account = Account.new(account_params)

    if @account.save
    else
      flash.now[:danger] = 'ユーザの登録に失敗しました。'
      render :new
    end
  end

  def edit
    @account = Account.find(params[:id])
  end

  def update
    @account = Account.find(params[:id])
    
    if @account.update(account_params)
    else
      flash.now[:danger] = 'アカウントの更新に失敗しました。'
      render :edit
    end
  end

  def destroy
  end
  
  private
  
  def account_params
    params.require(:account).permit(:mail_address, :account_name, :birthday, :sex, :todofuken_id, :password, :password_confirmation, :public_private)
  end
end
