class TodofukensController < ApplicationController
  before_action :require_account_logged_in
  
  def index
    if logged_in?
      if params[:serch].to_i == 1 #全件検索
        @todofukens = Todofuken.all
      elsif params[:serch].to_i == 2 #地域別
        @todofukens = Todofuken.where(region_id: params[:region_id].to_i)
      elsif params[:serch].to_i == 3 #検索ボックス
        @todofukens = Todofuken.where("todofuken_name Like :todofuken or region Like :todofuken", todofuken: "%#{params[:id]}%").order(id: :desc)
        if @todofukens.blank?
          @todofukens = Todofuken.all
          flash.now[:danger] = '入力に誤りがあります。'
        end
      else
        @todofukens = Todofuken.all
      end
    end
  end
end
