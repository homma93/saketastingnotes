class TastingnotesController < ApplicationController
  before_action :require_account_logged_in
  
  def index
    if logged_in?
      if params[:view].to_i == 1 #みんなのテイスティングノート用
        @tastingnotes = Tastingnote.eager_load(:sake, :account).where(tastingnotes: {sake_id: params[:sake_id], deleted_at: 0 }).where.not(tastingnotes: { account_id: params[:account_id] }).where(accounts: { public_private: 0 }).order(tasting_day: :desc).page(params[:page])
        @view_num = 1
        params[:view] = nil
      elsif params[:view].to_i == 2 #My日本酒マップ用
        #テイスティングの合計
        @tastingnote_nums = Tastingnote.where(tastingnotes: {account_id: current_account.id, deleted_at: 0}).count
        
        #地域別のテイスティング数 0:region_id 1:count
        @tastingnote_region_nums = Tastingnote.joins(sake: {sakagura: :todofuken}).where(tastingnotes: {account_id: current_account.id, deleted_at: 0}).group("todofukens.region, todofukens.region_id").order(region_id: :asc).count.pluck(0,1)
        
        #酒蔵数
        @sakagura_todofuken_nums = Todofuken.group("todofukens.region, todofukens.region_id").order(region_id: :asc).sum(:sakagura_num).pluck(0,1)
        
        #酒蔵制覇数
        @tastingnote_sakagura_nums = Tastingnote.find_by_sql(['select count(*),region, region_id from (SELECT distinct todofukens.region, todofukens.region_id, sakaguras.id FROM `tastingnotes` INNER JOIN `sakes` ON `sakes`.`id` = `tastingnotes`.`sake_id` INNER JOIN `sakaguras` ON `sakaguras`.`id` = `sakes`.`sakagura_id` INNER JOIN `todofukens` ON `todofukens`.`id` = `sakaguras`.`todofuken_id` WHERE `tastingnotes`.`account_id` = ? AND `tastingnotes`.`deleted_at` = 0) as sakagura_num group by region,region_id ORDER BY region_id ASC', current_account.id]).pluck('region_id','count(*)')

        #出身地域
        @region_id = Account.eager_load(:todofuken).where(accounts: {id: current_account})
        
        @view_num = 2
        params[:view] = nil
      else 
        @tastingnotes = Tastingnote.eager_load(:sake, :account).where(tastingnotes: {account_id: current_account.id, deleted_at: 0 }).order(tasting_day: :desc).page(params[:page])
        @view_num = 1
      end
    end
  end

  def show
    @tastingnote = Tastingnote.find(params[:id])
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
    @tastingnote = Tastingnote.find(params[:id])
    
    if @tastingnote.update(tastingnote_params)
      flash[:success] = 'テイスティングノートを更新しました。'
      redirect_to :action => "index"
    else
      flash.now[:danger] = 'テイスティングノート一覧の更新に失敗しました。'
      render :edit
    end
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
