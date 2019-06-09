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
  
  def sake_kind_conversion(sake_kind)
    case sake_kind
      when 1 then "普通酒"
      when 2 then "本醸造酒"
      when 3 then "特別本醸造酒"
      when 4 then "純米酒"
      when 5 then "特別純米酒"
      when 6 then "吟醸酒"
      when 7 then "純米吟醸酒"
      when 8 then "大吟醸酒"
      when 9 then "純米大吟醸酒"
      when 999999 then "その他・不明"
    end
  end
  
  def how_to_drink_conversion(how_to_drink)
    case how_to_drink
      when 0 then "冷"
      when 1 then "常温"
      when 2 then "ぬる燗"
      when 3 then "熱燗"
    end
  end
  
  def color_conversion(color)
    case color
      when 1 then "冴え（さえ）"
      when 2 then "照り（てり）"
      when 3 then "ぼけ"
      when 4 then "澄明度"
      when 5 then "透明度"
      when 6 then "黄金色（こがねいろ）"
      when 7 then "番茶色（ばんちゃいろ）"
      when 8 then "色沢良好（しきたくりょうこう）"
      when 9 then "色沢濃厚（しきたくのうこう）"
      when 10 then "混濁"
      when 999999 then "その他"
    end
  end
  
  def smell_conversion(smell)
    case smell
      when 1 then "華やかな香り"
      when 2 then "爽やかな香り"
      when 3 then "穏やかな香り"
      when 4 then "ふくよかな香り"
      when 999999 then "その他"
    end
  end
  
  def taste_conversion(taste)
    case taste
      when 1 then "非常に強い"
      when 2 then "強い"
      when 3 then "普通"
      when 4 then "弱い"
      when 5 then "非常に弱い"
    end
  end
end
