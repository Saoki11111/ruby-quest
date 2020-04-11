class GamesController
  EXP_CONSTANT = 2
  GOLD_CONSTANT = 3

  # バトルの処理
  def battle(**params)
    # build_characters を呼び出し
    build_characters(params)

    # 勇者の勝敗によってメッセージを変える
    if battle_result(brave)
      resul = calculate_of_exp_and_gold(monster)
      puts "#{brave.name}はたたかいに勝った"
      puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールを獲得した"
    else
      puts "#{brave.name}はたたかいに負けた"
      puts "目の前が真っ暗になった"
    end

    loop do
      brave.attack(monster)
      break if battle_end?(monster)
      monster.attack(brave)
      break if battle_end?(brave)
    end

  end



  # 以下メソッドはクラス外からは呼び出さない
  private
    # キャラクターのインスタンスをインスタンス変数に格納
    def build_characters(**params)
      @brave = params[:brave]
      @monster = params[:monster]
    end

    # バトル終了判定 
    def battle_end?(character)
      character.hp <=0
    end

    # 勇者の勝利判定
    def battle_result(brave)
      brave.hp > 0
    end

    # 経験値とゴールドの計算
    def calculate_of_exp_and_gold(monster)
      exp = (monster.offense + monster.defense) * EXP_CONSTANT
      gold = (monster.offense + monster.defense) * GOLD_CONSTANT
      result = {exp: exp, gold: gold}

      result
    end
end
