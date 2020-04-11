class Brave
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
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

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
# ハッシュ形式なのでどんなデータか把握しやすくなる
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

# ヒアドキュメントで出力
puts <<~TEXT
NAME:#{brave.name}
HP:#{brave.hp}
OFFENSE:#{brave.offense}
DEFENSE:#{brave.defense}
TEXT

# hp にダメージを与える処理
brave.hp -= 30

# ダメージに関するメッセージ
puts "#{brave.name}はダメージを受けた！残りのHPは#{brave.hp}だ"
