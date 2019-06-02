class TodofukensController < ApplicationController
  before_action :require_account_logged_in
  
  def index
    if logged_in?
      if params[:serch].to_i == 1 #全件検索
        @todofukens = Todofuken.all
      elsif params[:serch].to_i == 2 #地域別
        @todofukens = Todofuken.where(region_id: params[:region_id].to_i)
      else
        @todofukens = Todofuken.all
      end
    end
  end
end
