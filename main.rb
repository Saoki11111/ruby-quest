class Brave
  # initializeメソッドを定義
  # new 演算子から渡された引数を受け取る
  # params で一括で受け取る
  # 引数に**を記述:ハッシュしか受け取れなくなる
  def initialize(**params)
    # 各パラメータをハッシュで取得
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  # nameのゲッター
  def name
    @name
  end

  # hpのゲッター
  def hp
    @hp
  end

  # offenseのゲッター
    def offense
      @offense
    end

  # defenseのゲッター
  def defense
    @defense
  end

end

# 勇者クラスをインスタンス化
## パラメータの値をinitialize に渡す
# brave = Brave.new("テリー",500,150,100)
#
##パラメータの値をinitialize に渡す(パラメータを明示)
# brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)
#
## new 演算子ごとに渡す引数が増える ため initialize で ハッシュ化
brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)

# # 複数人の勇者を作成しても各勇者ごとに違ったパラメータを設定できるようになる。
# brave = Brave.new("テリー", 500, 150, 100)
# brave2= Brave.new("マロン", 200, 150, 100)
# brave3= Brave.new("プリン", 100, 300, 100)

# ヒアドキュメントで
puts <<~TEXT
NAME:#{brave.name}
HP:#{brave.hp}
OFFENSE:#{brave.offense}
DEFENSE:#{brave.defense}
TEXT
