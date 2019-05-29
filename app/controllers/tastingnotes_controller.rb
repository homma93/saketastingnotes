class TastingnotesController < ApplicationController
  before_action :require_account_logged_in
  
  def index
    if logged_in?
      @tastingnotes = Tastingnote.eager_load(:sake).where(tastingnotes: {account_id: current_account.id })
      #@tastingnotes = current_account.tastingnotes.order(id: :desc).page(params[:page])
    end
  end

  def show
  end

  def new
    @tastingnote = Tastingnote.new
  end

  def create
    @tastingnote = current_account.tastingnotes.build(tastingnote_params)
    
    if @tastingnote.save
      redirect_to tastingnotes_path
    else
      flash.now[:danger] = 'エラーがあります。'
      render 'new'
    end
  end

  def edit
    @tastingnote = Tastingnote.find(params[:id])
  end

  def update
  end

  def destroy
    @tastingnote = Tastingnote.find(params[:id])
    @tastingnote.destroy
    
    #画像ファイル削除
    if(!@tastingnote.image.nil?)
      FileUtils.rm_rf(Rails.root.to_s + "/public/uploads/tastingnote/image/" + params[:id].to_s)
    end
    if(!@tastingnote.tumami_image1.nil?)
      FileUtils.rm_rf(Rails.root.to_s + "/public/uploads/tastingnote/tumami_image1/" + params[:id].to_s)
    end
    if(!@tastingnote.tumami_image2.nil?)
      FileUtils.rm_rf(Rails.root.to_s + "/public/uploads/tastingnote/tumami_image2/" + params[:id].to_s)
    end
    if(!@tastingnote.tumami_image3.nil?)
      FileUtils.rm_rf(Rails.root.to_s + "/public/uploads/tastingnote/tumami_image3/" + params[:id].to_s)
    end
    
    redirect_to :action => "index"
  end
  
  private

  def tastingnote_params
    params.require(:tastingnote).permit(:content, :sake_id, :tasting_day, :sake_kind, 
                                        :sake_supplement, :how_to_drink, :color, :smell, 
                                        :smell_supplement, :sweet_taste, :acidity, :bitter_taste, 
                                        :umami, :alcohol, :taste_supplement, :image, :tumami_image1, 
                                        :tumami_image2, :tumami_image3, :comment, :evaluation )
  end
end
