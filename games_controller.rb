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
      break if battle_end? # 引数が不要になる

      # インスタンス変数に変更
      @monster.attack(@brave)
      break if battle_end? # 引数が不要になる
    end

    if battle_result # 引数が不要になる
      resul = calculate_of_exp_and_gold # 引数が不要になる
      # インスタンス変数に変更
      puts "#{@brave.name}はたたかいに勝った"
      puts "#{result[:exp]}の経験値と#{result[:gold]}ゴールを獲得した"
    else
      # インスタンス変数に変更
      puts "#{@brave.name}はたたかいに負けた"
      puts "目の前が真っ暗になった"
    end

  end

  private

    def build_characters(**params)
      # 勇者クラス、モンスタークラスそれぞれのインスタンスをインスタンス変数に格納
      @brave = params[:brave]
      @monster = params[:monster]
    end

    def battle_end?
    # 勇者かモンスター、どちらかの HP が 0 になったらバトルが終了する
      @brave.hp <= 0 || @monster.hp <=0
    end

    # 引数が不要になる
    def battle_result(brave)
      # インスタンス変数に変更
      @brave.hp > 0
    end

    # 引数が不要になる
    def calculate_of_exp_and_gold
      exp = (@monster.offense + @monster.defense) * EXP_CONSTANT
      gold = (@monster.offense + @monster.defense) * GOLD_CONSTANT
      result = {exp: exp, gold: gold}

      result
    end
end
