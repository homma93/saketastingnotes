module TastingnotesHelper
  def tastingnote_table(tastingnote_nums, tastingnote_region_nums, sakagura_todofuken_nums, tastingnote_sakagura_nums)
    @tastingnote_row = [["北海道", 0, 0.00, 0, 0.00], ["東北", 0, 0.00, 0, 0.00], ["関東", 0, 0.00, 0, 0.00],
                      ["北陸", 0, 0.00, 0, 0.00], ["甲信", 0, 0.00, 0, 0.00], ["東海", 0, 0.00, 0, 0.00],
                      ["関西", 0, 0.00, 0, 0.00], ["中国", 0, 0.00, 0, 0.00], ["四国", 0, 0.00, 0, 0.00], ["九州・沖縄", 0, 0.00, 0, 0.00]]
    
    #テイスティング数; テイスティング割合
    tastingnote_region_nums.each do |a, b|
      @tastingnote_row[a-1][1] = b
      @tastingnote_row[a-1][2] = (b.to_f/tastingnote_nums.to_f*100).round(2)
    end
    
    #酒蔵数
    sakagura_todofuken_nums.each do |c, d|
      @tastingnote_row[c-1][3] = d
    end
    
    #酒蔵制覇割合
    tastingnote_sakagura_nums.each do |e, f|
      @tastingnote_row[e-1][4] = (f.to_f/@tastingnote_row[e-1][3].to_f*100).round(2)
    end
    
    return @tastingnote_row
  end
  
  def place(region_id)
    case region_id
      when 1 then "北海道の酒造組合　　　　"
      when 2 then "東北地方の酒造組合　　　"
      when 3 then "関東地方の酒造組合　　　"
      when 4 then "北陸地方の酒造組合　　　"
      when 5 then "甲信地方の酒造組合　　　"
      when 6 then "東海地方の酒造組合　　　"
      when 7 then "関西地方の酒造組合　　　"
      when 8 then "中国地方の酒造組合　　　"
      when 9 then "四国地方の酒造組合　　　"
      when 10 then "九州・沖縄地方の酒造組合"
    end
  end
  
  def random_place(region_id)
    @place = [0, 0]
    
    loop do
      @place[0] = rand(1 .. 10)
      break @place[0] != region_id 
    end
    
    loop do
      @place[1] = rand(1 .. 10)
      break (@place[1] != region_id) && (@place[1] != @place[0])
    end
    
    return @place
  end
end
