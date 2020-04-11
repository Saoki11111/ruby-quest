class GamesController
  EXP_CONSTANT = 2
  GOLD_CONSTANT = 3

  # バトルの処理
  def battle(**params)
    # build_characters を呼び出し
    build_characters(params)

    loop do
      # インスタンス変数に変更
      @brave.attack(@monster)
      break if battle_end? 

      # インスタンス変数に変更
      @monster.attack(@brave)
      break if battle_end? 
    end

    # battle_judgement メソッドを呼び出す
    battle_judgement
  end
  
  private

    def build_characters(**params)
      @brave = params[:brave]
      @monster = params[:monster]
    end

    def battle_end?
      @brave.hp <= 0 || @monster.hp <=0
    end


    # brave_win? にメソッド名を変更
    def brave_win?
      @brave.hp > 0
    end

    # 勇者の勝敗によりメッセージを変更するメソッド
    def battle_judgement
      # brave_win? を呼び出す
      if brave_win?
        result = calculate_of_exp_and_gold 


        # puts "#{@brave.name}はたたかいに勝った"
        # puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールを獲得した"
      else
        # puts "#{@brave.name}はたたかいに負けた"
        # puts "目の前が真っ暗になった"
      end
    end

    def calculate_of_exp_and_gold
      exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
      gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
      result = {exp: exp, gold: gold}

      result
    end
end
