class Brave
  # # attr_reader の記述でゲッターを省略できる(ゲッターの役割になる)
  # attr_reader :name, :hp, offense
  # attr_reader :hp
  # attr_reader :offense
  # attr_reader :defense
  # # 複数同時に指定できる。
  attr_reader :name, :offense, :defense
  ## attr_writer で セッターを定義
  # attr_writer :hp
  # セッターゲッターを一括定義
  attr_accessor :hp

  def initialize(**params)
    # 各パラメータをハッシュで取得
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end

  ## セッターを再定義
  ## 短くかける ↑
  #def hp=(hp)
  #  @hp = hp
  #end

end

brave = Brave.new(name: "テリー", hp: 500, offense: 150, defense: 100)

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
