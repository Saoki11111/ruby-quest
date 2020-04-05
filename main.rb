class Brave
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  # 引数でモンスタークラスのインスタンスを受け取る
  def attack(monster)
    # モンスタークラスのインスタンスが参照できているか確かめる
    puts "テスト: #{monster.name}のHPを表示 -> #{monster.hp}"
  end
end

class Monster
  # 値の取り出し
  attr_reader :name, :offense, :defense
  # 値の取り出し、書き込みが可能
  attr_accessor :hp

  # **params でハッシュ形式のみしか受け付けないようにする
  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end

# 勇者クラスとモンスタークラスをインスタンス化
# ハッシュ形式なのでどんなデータか把握しやすくなる
brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

brave.attack(monster)
